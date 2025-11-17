# verify_migration_debug.py
import pyodbc
import psycopg2
import configparser
import time
import datetime
from typing import List, Dict, Any

# === CHARGEMENT ===
def load_settings():
    config = configparser.ConfigParser()
    config.read('settings.ini')
    return {
        'mssql': config['OldDB'],
        'pgsql': config['NewDB']
    }

# === CONNEXIONS SÉCURISÉES ===
def connect_databases():
    settings = load_settings()

    # MSSQL
    mssql_conn_str = (
        f"Driver={{ODBC Driver 17 for SQL Server}};"
        f"Server={settings['mssql']['host']},{settings['mssql']['port']};"
        f"Database={settings['mssql']['name']};"
        f"UID={settings['mssql']['user']};PWD={settings['mssql']['pwd']};"
    )
    try:
        mssql = pyodbc.connect(mssql_conn_str)
        print("Connexion SQL Server : OK")
    except Exception as e:
        print(f"ERREUR MSSQL : {e}")
        exit(1)

    # PostgreSQL
    pgsql_conn_str = (
        f"host={settings['pgsql']['host']} port={settings['pgsql']['port']} "
        f"dbname={settings['pgsql']['name']} user={settings['pgsql']['user']} "
        f"password={settings['pgsql']['pwd']}"
    )
    try:
        pgsql = psycopg2.connect(pgsql_conn_str)
        print("Connexion PostgreSQL : OK\n")
    except Exception as e:
        print(f"ERREUR POSTGRES : {e}")
        exit(1)

    return mssql.cursor(), pgsql.cursor()

# === LIRE TABLES ===
def get_tables() -> List[str]:
    with open('tables.txt', 'r') as f:
        return [line.strip() for line in f if line.strip() and not line.startswith('#')]

# === VÉRIFICATION AVEC DÉTAILS COMPLÈTS ===
def verify_table(mssql_cur, pgsql_cur, table: str) -> Dict[str, Any]:
    result = {"table": table, "status": "OK", "details": []}

    # 1. COUNT
    try:
        mssql_cur.execute(f"SELECT COUNT(*) FROM [{table}]")
        mssql_count = mssql_cur.fetchone()[0]
    except Exception as e:
        return {"table": table, "status": "ERREUR", "details": [f"MSSQL COUNT échoué: {e}"]}

    try:
        pgsql_cur.execute(f'SELECT COUNT(*) FROM "{table}"')
        pgsql_count = pgsql_cur.fetchone()[0]
    except Exception as e:
        return {"table": table, "status": "ERREUR", "details": [f"PostgreSQL COUNT échoué: {e}"]}

    if mssql_count != pgsql_count:
        result["status"] = "ERREUR"
        result["details"].append(f"COUNT: MSSQL={mssql_count} | PG={pgsql_count}")
    else:
        result["details"].append(f"COUNT OK: {mssql_count}")

    # 2. SOMMES NUMÉRIQUES
    try:
        pgsql_cur.execute("""
            SELECT column_name
            FROM information_schema.columns
            WHERE table_name = %s
              AND data_type IN ('integer', 'bigint', 'numeric', 'double precision', 'real')
              AND column_name NOT ILIKE '%id' AND column_name NOT ILIKE '%uuid'
        """, (table,))
        cols = [r[0] for r in pgsql_cur.fetchall()]
    except Exception as e:
        result["details"].append(f"Impossible de lister colonnes numériques: {e}")
        return result

    for col in cols:
        try:
            mssql_cur.execute(f"SELECT COALESCE(SUM([{col}]), 0) FROM [{table}]")
            mssql_sum = mssql_cur.fetchone()[0] or 0

            pgsql_cur.execute(f'SELECT COALESCE(SUM("{col}"), 0) FROM "{table}"')
            pgsql_sum = pgsql_cur.fetchone()[0] or 0

            if mssql_sum != pgsql_sum:
                result["status"] = "ERREUR"
                result["details"].append(f"SUM {col}: MSSQL={mssql_sum} | PG={pgsql_sum}")
            else:
                result["details"].append(f"SUM {col}: OK")
        except Exception as e:
            result["details"].append(f"SUM {col}: ERREUR → {e}")

    return result

# === MAIN ===
def main():
    start_time = time.time()
    print("DÉMARRAGE VÉRIFICATION MIGRATION\n")

    mssql_cur, pgsql_cur = connect_databases()
    tables = get_tables()

    errors = 0
    with open("verification_debug.log", "w", encoding="utf-8") as log:
        log.write(f"VÉRIFICATION DU {datetime.datetime.now()}\n\n")

        for table in tables:
            print(f"→ Vérification {table}...")
            result = verify_table(mssql_cur, pgsql_cur, table)

            status = "ERREUR" if result["status"] != "OK" else "OK"
            print(f"   {status}\n")

            log.write(f"TABLE: {table}\n")
            log.write(f"STATUT: {result['status']}\n")
            for d in result["details"]:
                log.write(f"   • {d}\n")
            log.write("\n" + "="*70 + "\n\n")

            if result["status"] != "OK":
                errors += 1

    total_time = datetime.timedelta(seconds=time.time() - start_time)
    summary = f"\nFIN : {len(tables)} tables, {errors} erreurs, en {total_time}\n"
    if errors == 0:
        summary += "MIGRATION 100% VALIDE !\n"
    else:
        summary += "VOIR verification_debug.log POUR DÉTAILS\n"

    print(summary)
    with open("verification_debug.log", "a") as log:
        log.write(summary)

    mssql_cur.close()
    pgsql_cur.close()

if __name__ == "__main__":
    main()

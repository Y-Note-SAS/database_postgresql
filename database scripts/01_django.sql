--
-- TOC entry 233 (class 1259 OID 20483)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" "uuid" NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);


-- ALTER TABLE "public"."django_admin_log" OWNER TO "postgres";

--
-- TOC entry 232 (class 1259 OID 20481)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_admin_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_admin_log_id_seq" OWNER TO "postgres";

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_admin_log_id_seq" OWNED BY "public"."django_admin_log"."id";


--
-- TOC entry 205 (class 1259 OID 20223)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);


-- ALTER TABLE "public"."django_content_type" OWNER TO "postgres";

--
-- TOC entry 204 (class 1259 OID 20221)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_content_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_content_type_id_seq" OWNER TO "postgres";

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_content_type_id_seq" OWNED BY "public"."django_content_type"."id";


--
-- TOC entry 203 (class 1259 OID 20212)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_migrations" (
    "id" integer NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);


-- ALTER TABLE "public"."django_migrations" OWNER TO "postgres";

--
-- TOC entry 202 (class 1259 OID 20210)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_migrations_id_seq" OWNER TO "postgres";

--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_migrations_id_seq" OWNED BY "public"."django_migrations"."id";


--
-- TOC entry 309 (class 1259 OID 21369)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);


-- ALTER TABLE "public"."django_session" OWNER TO "postgres";
--
-- TOC entry 3336 (class 2604 OID 20486)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_admin_log_id_seq"'::"regclass");


--
-- TOC entry 3325 (class 2604 OID 20226)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_content_type_id_seq"'::"regclass");


--
-- TOC entry 3324 (class 2604 OID 20215)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_migrations_id_seq"'::"regclass");

--
-- TOC entry 3455 (class 2606 OID 20492)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3374 (class 2606 OID 20230)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model");


--
-- TOC entry 3376 (class 2606 OID 20228)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3372 (class 2606 OID 20220)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3684 (class 2606 OID 21376)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");

--
-- TOC entry 3453 (class 1259 OID 20503)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING "btree" ("content_type_id");


--
-- TOC entry 3456 (class 1259 OID 20504)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING "btree" ("user_id");


--
-- TOC entry 3682 (class 1259 OID 21378)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING "btree" ("expire_date");


--
-- TOC entry 3685 (class 1259 OID 21377)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING "btree" ("session_key" "varchar_pattern_ops");

-- --
-- -- TOC entry 3722 (class 2606 OID 20267)
-- -- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
-- --

-- ALTER TABLE ONLY "public"."auth_permission"
--     ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3739 (class 2606 OID 20493)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3740 (class 2606 OID 20498)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_User_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_core_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."core_User"("id") DEFERRABLE INITIALLY DEFERRED;


SELECT setval('"public"."django_migrations_id_seq"', (select coalesce(max("id"), 1) from "public"."django_migrations"), true);


--
-- TOC entry 207 (class 1259 OID 20243)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);


ALTER TABLE "public"."auth_permission" OWNER TO "sa";

--
-- TOC entry 206 (class 1259 OID 20241)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."auth_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."auth_permission_id_seq" OWNER TO "sa";

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."auth_permission_id_seq" OWNED BY "public"."auth_permission"."id";

--
-- TOC entry 3326 (class 2604 OID 20246)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_permission_id_seq"'::"regclass");

--
-- TOC entry 3379 (class 2606 OID 20273)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename");


--
-- TOC entry 3381 (class 2606 OID 20248)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");

--
-- TOC entry 3377 (class 1259 OID 20274)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING "btree" ("content_type_id");


--
-- Table: public.auth_group
--

CREATE TABLE "public"."auth_group" (
    "id" serial PRIMARY KEY,
    "name" varchar(150) NOT NULL
);

--
-- Constraints
--

ALTER TABLE ONLY "public"."auth_group"
    ADD CONSTRAINT "auth_group_name_a6ea08ec_uniq" UNIQUE ("name");


--
-- Table: public.auth_group_permissions
--

CREATE TABLE "public"."auth_group_permissions" (
    "id" serial PRIMARY KEY,
    "group_id" integer NOT NULL,
    "permission_id" integer NOT NULL
);


--
-- Foreign Keys
--

-- ALTER TABLE ONLY "public"."auth_group_permissions"
--     ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
--     FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id"
    FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Indexes
--

CREATE INDEX "auth_group_permissions_group_id_b120cbf9"
    ON "public"."auth_group_permissions" ("group_id");

CREATE INDEX "auth_group_permissions_permission_id_84c5c92e"
    ON "public"."auth_group_permissions" ("permission_id");

CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq"
    ON "public"."auth_group_permissions" ("group_id", "permission_id")
    WHERE ("group_id" IS NOT NULL AND "permission_id" IS NOT NULL);



--
-- TOC entry 3724 (class 2606 OID 20281)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3723 (class 2606 OID 20276)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3722 (class 2606 OID 20267)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;

--
-- TOC entry 3738 (class 2606 OID 20472)
-- Name: core_User_user_permissions core_User_user_permi_permission_id_f70a87da_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions"
    ADD CONSTRAINT "core_User_user_permi_permission_id_f70a87da_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tblProgram; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProgram" (
    "idProgram" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "Name" character varying(248) NOT NULL,
    "validityDateFrom" timestamp with time zone,
    "validityDateTo" timestamp with time zone,
    "programCode" character varying(10),
    CONSTRAINT "tblProgram_pkey" PRIMARY KEY ("idProgram")
);

-- Création de la table tblProgram_user
CREATE TABLE "public"."tblProgram_user" (
    "id" serial PRIMARY KEY,
    "program_id" integer NOT NULL,
    "interactiveuser_id" integer NOT NULL,

    CONSTRAINT "tblProgram_user_program_id_9e6ebdcf_fk"
        FOREIGN KEY ("program_id") REFERENCES "public"."tblProgram" ("idProgram"),

    CONSTRAINT "tblProgram_user_interactiveuser_id_289b9595_fk"
        FOREIGN KEY ("interactiveuser_id") REFERENCES "public"."tblUsers" ("UserID")
);

-- Index sur program_id
CREATE INDEX "tblProgram_user_program_id_9e6ebdcf"
    ON "public"."tblProgram_user" ("program_id");

-- Index sur interactiveuser_id
CREATE INDEX "tblProgram_user_interactiveuser_id_289b9595"
    ON "public"."tblProgram_user" ("interactiveuser_id");

-- Index unique conditionnel (comme en SQL Server)
CREATE UNIQUE INDEX "tblProgram_user_program_id_interactiveuser_id_8af18afe_uniq"
    ON "public"."tblProgram_user" ("program_id", "interactiveuser_id")
    WHERE "program_id" IS NOT NULL AND "interactiveuser_id" IS NOT NULL;


--
-- Name: tblChequeSanteImport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblChequeSanteImport" (
    "ChequeImportID" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "importDate" timestamp with time zone NOT NULL,
    "ImportFile" character varying(100),
    "UserID" integer NOT NULL,
    CONSTRAINT "tblChequeSanteImport_pkey" PRIMARY KEY ("ChequeImportID"),
    CONSTRAINT "tblChequeSanteImport_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "public"."tblUsers" ("UserID")
);


--
-- Name: tblChequeSanteImport_UserID_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblChequeSanteImport_UserID_idx" ON "public"."tblChequeSanteImport" ("UserID");


--
-- Name: tblChequeSanteImportLine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblChequeSanteImportLine" (
    "idChequeImportLine" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "chequeImportLineCode" character varying(100) NOT NULL,
    "chequeImportLineDate" timestamp with time zone NOT NULL,
    "chequeImportLineStatus" character varying(50) NOT NULL,
    "chequeImportId_id" integer NOT NULL,
    CONSTRAINT "tblChequeSanteImportLine_pkey" PRIMARY KEY ("idChequeImportLine"),
    CONSTRAINT "tblChequeSanteImportLine_chequeImportId_id_fkey" FOREIGN KEY ("chequeImportId_id") REFERENCES "public"."tblChequeSanteImport" ("ChequeImportID")
);

--
-- Name: tblChequeSanteImportLine_chequeImportId_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblChequeSanteImportLine_chequeImportId_id_idx" ON "public"."tblChequeSanteImportLine" ("chequeImportId_id");


--
-- Name: cheque_updated_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."cheque_updated_history" (
    "ChequeUpdatedID" integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    "updated_date" timestamp with time zone NOT NULL,
    "description" text NOT NULL,
    "chequeImportLine_id" integer NOT NULL,
    "UserID" integer NOT NULL,
    CONSTRAINT "cheque_updated_history_pkey" PRIMARY KEY ("ChequeUpdatedID"),
    CONSTRAINT "cheque_updated_history_chequeImportLine_id_fkey" FOREIGN KEY ("chequeImportLine_id") REFERENCES "public"."tblChequeSanteImportLine" ("idChequeImportLine"),
    CONSTRAINT "cheque_updated_history_UserID_fkey" FOREIGN KEY ("UserID") REFERENCES "public"."tblUsers" ("UserID")
);

--
-- Name: cheque_updated_history_chequeImportLine_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "cheque_updated_history_chequeImportLine_id_idx" ON "public"."cheque_updated_history" ("chequeImportLine_id");

--
-- Name: cheque_updated_history_UserID_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "cheque_updated_history_UserID_idx" ON "public"."cheque_updated_history" ("UserID");



-- Additionals constraints
ALTER TABLE "tblPhotos" ALTER COLUMN "PhotoFolder" DROP NOT NULL;

ALTER TABLE "tblInsuree" ALTER COLUMN "FamilyID" DROP NOT NULL;

ALTER TABLE "tblInsuree"
ALTER COLUMN "CHFID" TYPE character varying(20);

ALTER TABLE "tblClaim"
ALTER COLUMN "ClaimCode" TYPE character varying(32);

--
-- Table: public.django_apscheduler_djangojob
--

CREATE TABLE "public"."django_apscheduler_djangojob" (
    "id" varchar(255) NOT NULL,
    "next_run_time" timestamp with time zone NULL,
    "job_state" bytea NOT NULL,
    CONSTRAINT "django_apscheduler_djangojob_pkey" PRIMARY KEY ("id")
);

-- Index on next_run_time (for scheduling)
CREATE INDEX "django_apscheduler_djangojob_next_run_time_2f022619"
    ON "public"."django_apscheduler_djangojob" ("next_run_time");


--
-- Table: public.django_apscheduler_djangojobexecution
--

CREATE TABLE "public"."django_apscheduler_djangojobexecution" (
    "id" bigserial PRIMARY KEY,
    "status" varchar(50) NOT NULL,
    "run_time" timestamp with time zone NOT NULL,
    "duration" numeric(15, 2),
    "finished" numeric(15, 2),
    "exception" varchar(1000),
    "traceback" text,
    "job_id" varchar(255) NOT NULL,
    
    CONSTRAINT "django_apscheduler_djangojobexecution_job_id_daf5090a_fk" 
        FOREIGN KEY ("job_id") REFERENCES "public"."django_apscheduler_djangojob" ("id"),
    
    CONSTRAINT "unique_job_executions" 
        UNIQUE ("job_id", "run_time")
);

-- Indexes for performance

CREATE INDEX "django_apscheduler_djangojobexecution_job_id_daf5090a"
    ON "public"."django_apscheduler_djangojobexecution" ("job_id");

CREATE INDEX "django_apscheduler_djangojobexecution_run_time_16edd96b"
    ON "public"."django_apscheduler_djangojobexecution" ("run_time");


--
-- Table: public.refresh_token_refreshtoken
--

CREATE TABLE "public"."refresh_token_refreshtoken" (
    "id" bigserial PRIMARY KEY,
    "token" varchar(255) NOT NULL,
    "created" timestamp with time zone NOT NULL,
    "revoked" timestamp with time zone,
    "user_id" "uuid" NOT NULL,

    CONSTRAINT "refresh_token_refreshtoken_user_id_45383307_fk" 
        FOREIGN KEY ("user_id") REFERENCES "public"."core_User" ("id")
);

-- Conditional Unique Index (on token and revoked when both are not null)
CREATE UNIQUE INDEX "refresh_token_refreshtoken_token_revoked_b683a545_uniq"
    ON "public"."refresh_token_refreshtoken" ("token", "revoked")
    WHERE "token" IS NOT NULL AND "revoked" IS NOT NULL;

-- Standard foreign key index for performance
CREATE INDEX "refresh_token_refreshtoken_user_id_45383307"
    ON "public"."refresh_token_refreshtoken" ("user_id");


--
-- TOC entry XXX (class 1259 OID XXXXX)
-- Name: tblInsureeStatusReason; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblInsureeStatusReason" (
    "ValidityFrom" timestamp(6) NOT NULL,
    "ValidityTo" timestamp(6),
    "LegacyID" integer,
    "StatusReasonId" smallint NOT NULL,
    "StatusReason" character varying(50) NOT NULL,
    "Code" character varying(5) NOT NULL,
    "status_type" character varying(2) NOT NULL
);


--
-- TOC entry XXX (class 2606 OID XXXXX)
-- Name: tblInsureeStatusReason_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsureeStatusReason"
    ADD CONSTRAINT "tblInsureeStatusReason_pkey" PRIMARY KEY ("StatusReasonId");


--
-- TOC entry 310 (class 1259 OID 21370)
-- Name: policy_PolicyMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."policy_PolicyMutation" (
    "id" "uuid" NOT NULL,
    "mutation_id" "uuid" NOT NULL,
    "policy_id" integer NOT NULL,
    CONSTRAINT "location_PolicyMutation_mutation_id_11b3b8d1_fk_core_Mutation_Log_id"
        FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log" ("id"),
    CONSTRAINT "location_PolicyMutation_policy_id_1caf1dc7_fk_tblPolicy_PolicyID"
        FOREIGN KEY ("policy_id") REFERENCES "public"."tblPolicy" ("PolicyID"),
    PRIMARY KEY ("id")
);

--
-- TOC entry 3337 (class 1259 OID 21371)
-- Name: location_PolicyMutation_policy_id_1caf1dc7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_PolicyMutation_policy_id_1caf1dc7"
    ON "public"."policy_PolicyMutation" ("policy_id");


--
-- TOC entry 3338 (class 1259 OID 21372)
-- Name: location_PolicyMutation_mutation_id_11b3b8d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_PolicyMutation_mutation_id_11b3b8d1"
    ON "public"."policy_PolicyMutation" ("mutation_id");


--
-- TOC entry 3340 (class 1259 OID 21374)
-- Name: unique_policy_validity_to_null; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "unique_policy_validity_to_null"
    ON "public"."tblPolicyRenewals" ("PolicyID", "ValidityTo")
    WHERE "ValidityTo" IS NULL;


--
-- TOC entry 3360 (class 1259 OID 21394)
-- Name: contribution_PremiumMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."contribution_PremiumMutation" (
    "id" "uuid" NOT NULL,
    "mutation_id" "uuid" NOT NULL,
    "premium_id" integer NOT NULL,
    PRIMARY KEY ("id")
);


--
-- TOC entry 3361 (class 2606 OID 21395)
-- Name: contribution_PremiumMutation_mutation_id_cc6e4af5_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."contribution_PremiumMutation"
    ADD CONSTRAINT "contribution_PremiumMutation_mutation_id_cc6e4af5_fk"
    FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log" ("id");


--
-- TOC entry 3362 (class 2606 OID 21396)
-- Name: contribution_PremiumMutation_premium_id_3457b571_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."contribution_PremiumMutation"
    ADD CONSTRAINT "contribution_PremiumMutation_premium_id_3457b571_fk"
    FOREIGN KEY ("premium_id") REFERENCES "public"."tblPremium" ("PremiumId");


--
-- TOC entry 3363 (class 1259 OID 21397)
-- Name: idx_contribution_PremiumMutation_premium_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_contribution_PremiumMutation_premium_id"
    ON "public"."contribution_PremiumMutation" ("premium_id");


--
-- TOC entry 3364 (class 1259 OID 21398)
-- Name: idx_contribution_PremiumMutation_mutation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_contribution_PremiumMutation_mutation_id"
    ON "public"."contribution_PremiumMutation" ("mutation_id");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: tblClaimServicesItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimServicesItems" (
    "idCsi" serial PRIMARY KEY,
    "qty_provided" integer NULL,
    "qty_displayed" integer NULL,
    "created_date" timestamp with time zone NULL,
    "price" numeric(18, 2) NULL,
    "ClaimServiceID" integer NOT NULL,
    "ItemID" integer NOT NULL,
    "qty_adjusted" integer NULL
);


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: FK to tblClaimServices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServicesItems"
    ADD CONSTRAINT "tblClaimServicesItems_ClaimServiceID_985f5482_fk"
    FOREIGN KEY ("ClaimServiceID") REFERENCES "public"."tblClaimServices" ("ClaimServiceID");


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: FK to tblItems; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServicesItems"
    ADD CONSTRAINT "tblClaimServicesItems_ItemID_feb1695e_fk"
    FOREIGN KEY ("ItemID") REFERENCES "public"."tblItems" ("ItemID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: Index on ItemID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblClaimServicesItems_ItemID"
    ON "public"."tblClaimServicesItems" ("ItemID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: Index on ClaimServiceID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblClaimServicesItems_ClaimServiceID"
    ON "public"."tblClaimServicesItems" ("ClaimServiceID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: tblClaimServicesService; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimServicesService" (
    "idCss" serial PRIMARY KEY,
    "qty_provided" integer NULL,
    "qty_displayed" integer NULL,
    "created_date" timestamp with time zone NULL,
    "price" numeric(18, 2) NULL,
    "claimServiceID" integer NOT NULL,
    "ServiceId" integer NOT NULL,
    "qty_adjusted" integer NULL
);


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: FK to tblClaimServices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServicesService"
    ADD CONSTRAINT "tblClaimServicesService_claimServiceID_b7ddb073_fk"
    FOREIGN KEY ("claimServiceID") REFERENCES "public"."tblClaimServices" ("ClaimServiceID");


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: FK to tblServices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServicesService"
    ADD CONSTRAINT "tblClaimServicesService_ServiceId_885c2f65_fk"
    FOREIGN KEY ("ServiceId") REFERENCES "public"."tblServices" ("ServiceID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: Index on claimServiceID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblClaimServicesService_claimServiceID"
    ON "public"."tblClaimServicesService" ("claimServiceID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: Index on ServiceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblClaimServicesService_ServiceId"
    ON "public"."tblClaimServicesService" ("ServiceId");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: tblHF_program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblHF_program" (
    "id" serial PRIMARY KEY,
    "healthfacility_id" integer NOT NULL,
    "program_id" integer NOT NULL
);


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: tblHF_program_healthfacility_id_cf480a69_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF_program"
    ADD CONSTRAINT "tblHF_program_healthfacility_id_cf480a69_fk"
    FOREIGN KEY ("healthfacility_id") REFERENCES "public"."tblHF" ("HfID");


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: tblHF_program_program_id_8bef9566_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF_program"
    ADD CONSTRAINT "tblHF_program_program_id_8bef9566_fk"
    FOREIGN KEY ("program_id") REFERENCES "public"."tblProgram" ("idProgram");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: idx_tblHF_program_program_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblHF_program_program_id"
    ON "public"."tblHF_program" ("program_id");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: idx_tblHF_program_healthfacility_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblHF_program_healthfacility_id"
    ON "public"."tblHF_program" ("healthfacility_id");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: uq_tblHF_program_healthfacility_id_program_id; Type: UNIQUE INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "uq_tblHF_program_healthfacility_id_program_id"
    ON "public"."tblHF_program" ("healthfacility_id", "program_id")
    WHERE "healthfacility_id" IS NOT NULL AND "program_id" IS NOT NULL;


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: tblProductContainedPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProductContainedPackage" (
    "idPCP" serial PRIMARY KEY,
    "qty" integer,
    "created_date" timestamp(6),
    "price" numeric(18,2),
    "ItemID" integer NOT NULL,
    "ServiceID" integer NOT NULL,
    "status" boolean NOT NULL
);


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: tblProductContainedPackage_ItemID_9472c0aa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductContainedPackage"
    ADD CONSTRAINT "tblProductContainedPackage_ItemID_9472c0aa_fk"
    FOREIGN KEY ("ItemID") REFERENCES "public"."tblItems" ("ItemID");


--
-- TOC entry XXXX (class 2606 OID ...)
-- Name: tblProductContainedPackage_ServiceID_ee7cc682_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductContainedPackage"
    ADD CONSTRAINT "tblProductContainedPackage_ServiceID_ee7cc682_fk"
    FOREIGN KEY ("ServiceID") REFERENCES "public"."tblServices" ("ServiceID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: idx_tblProductContainedPackage_ServiceID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblProductContainedPackage_ServiceID"
    ON "public"."tblProductContainedPackage" ("ServiceID");


--
-- TOC entry XXXX (class 1259 OID ...)
-- Name: idx_tblProductContainedPackage_ItemID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblProductContainedPackage_ItemID"
    ON "public"."tblProductContainedPackage" ("ItemID");

--
-- TOC entry 4000 (class 1259 OID ...)
-- Name: tblServiceContainedPackage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblServiceContainedPackage" (
    "idSCP" serial PRIMARY KEY,
    "qty" integer NULL,
    "created_date" timestamp with time zone NULL,
    "price" numeric(18,2) NULL,
    "ServiceId" integer NOT NULL,
    "ServiceLinked" integer NOT NULL,
    "status" boolean NOT NULL
);

--
-- TOC entry 4001 (class 2606 OID ...)
-- Name: tblServiceContainedPackage_ServiceId_e58d9434_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblServiceContainedPackage"
    ADD CONSTRAINT "tblServiceContainedPackage_ServiceId_e58d9434_fk"
    FOREIGN KEY ("ServiceId") REFERENCES "public"."tblServices" ("ServiceID");

--
-- TOC entry 4002 (class 2606 OID ...)
-- Name: tblServiceContainedPackage_ServiceLinked_6e69fdb5_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblServiceContainedPackage"
    ADD CONSTRAINT "tblServiceContainedPackage_ServiceLinked_6e69fdb5_fk"
    FOREIGN KEY ("ServiceLinked") REFERENCES "public"."tblServices" ("ServiceID");

--
-- TOC entry 4003 (class 1259 OID ...)
-- Name: idx_tblServiceContainedPackage_ServiceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblServiceContainedPackage_ServiceId"
    ON "public"."tblServiceContainedPackage" ("ServiceId");

--
-- TOC entry 4004 (class 1259 OID ...)
-- Name: idx_tblServiceContainedPackage_ServiceLinked; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblServiceContainedPackage_ServiceLinked"
    ON "public"."tblServiceContainedPackage" ("ServiceLinked");

-- 
-- TOC entry XXXX (class 1259 OID ...)
-- Name: claim_ClaimAttachment_ClaimAttachmentType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."claim_ClaimAttachment_ClaimAttachmentType" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone NULL,
    "LegacyID" integer NULL,
    "ClaimAttachmentTypeId" smallint NOT NULL,
    "ClaimAttachmentType" varchar(50) NOT NULL,
    "is_autogenerated" boolean NOT NULL,
    "claim_general_type" varchar(10) NOT NULL,
    PRIMARY KEY ("ClaimAttachmentTypeId")
); 

--
-- TOC entry 1236 (class 2606 OID 30003)
-- Name: core_UserMutation_core_user_id_b5140846_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY "public"."core_UserMutation"
--     ADD CONSTRAINT "core_UserMutation_core_user_id_b5140846_fk"
--     FOREIGN KEY ("core_user_id") REFERENCES "public"."core_User" ("id");


--
-- TOC entry 1237 (class 2606 OID 30004)
-- Name: core_UserMutation_mutation_id_854fb79c_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_UserMutation"
    ADD CONSTRAINT "core_UserMutation_mutation_id_854fb79c_fk"
    FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log" ("id");


--
-- TOC entry 1238 (class 1259 OID 30005)
-- Name: core_UserMutation_mutation_id_854fb79c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_UserMutation_mutation_id_854fb79c"
    ON "public"."core_UserMutation" USING btree ("mutation_id");


--
-- TOC entry 1239 (class 1259 OID 30006)
-- Name: core_UserMutation_user_id_c9aaa69e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_UserMutation_user_id_c9aaa69e"
    ON "public"."core_UserMutation" USING btree ("core_user_id");


--
-- TOC entry 5000 (class 1259 OID 40000)
-- Name: tblInvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblInvoice" (
    "UUID" "uuid" NOT NULL,
    "isDeleted" boolean NOT NULL,
    "Json_ext" text,
    "DateCreated" timestamp with time zone,
    "DateUpdated" timestamp with time zone,
    "version" integer NOT NULL,
    "DateValidFrom" timestamp with time zone NOT NULL,
    "DateValidTo" timestamp with time zone,
    "ReplacementUUID" "uuid",
    "ThirdpartyId" varchar(255),
    "CodeTp" varchar(255),
    "Code" varchar(255) NOT NULL,
    "CodeExt" varchar(255),
    "DateDue" date,
    "DatePayed" date,
    "AmountDiscount" numeric(18,2),
    "AmountNet" numeric(18,2) NOT NULL,
    "AmountTotal" numeric(18,2) NOT NULL,
    "TaxAnalysis" text,
    "Status" smallint NOT NULL,
    "CurrencyTpCode" varchar(255) NOT NULL,
    "CurrencyCode" varchar(255) NOT NULL,
    "Note" text,
    "Terms" text,
    "PaymentReference" varchar(255),
    "SubjectId" varchar(255),
    "DateInvoice" date,
    "SubjectType" integer,
    "ThirdpartyType" integer,
    "UserCreatedUUID" "uuid" NOT NULL,
    "UserUpdatedUUID" "uuid" NOT NULL
);

--
-- TOC entry 5001 (class 2606 OID 40001)
-- Name: tblInvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoice"
    ADD CONSTRAINT "tblInvoice_pkey" PRIMARY KEY ("UUID");

--
-- TOC entry 5002 (class 2608 OID 40002)
-- Name: tblInvoice_Json_ext_check; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY "public"."tblInvoice"
--     ADD CONSTRAINT "tblInvoice_Json_ext_check"
--     CHECK (jsonb_typeof(to_jsonb("Json_ext"::text)) IS NOT NULL);

--
-- TOC entry 5003 (class 2608 OID 40003)
-- Name: tblInvoice_TaxAnalysis_check; Type: CONSTRAINT; Schema: public; Owner: postgres
--

-- ALTER TABLE ONLY "public"."tblInvoice"
--     ADD CONSTRAINT "tblInvoice_TaxAnalysis_check"
--     CHECK (jsonb_typeof(to_jsonb("TaxAnalysis"::text)) IS NOT NULL);

--
-- TOC entry 5004 (class 2606 OID 40004)
-- Name: tblInvoice_SubjectType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoice"
    ADD CONSTRAINT "tblInvoice_SubjectType_fkey"
    FOREIGN KEY ("SubjectType") REFERENCES "public"."django_content_type" ("id");

--
-- TOC entry 5005 (class 2606 OID 40005)
-- Name: tblInvoice_ThirdpartyType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoice"
    ADD CONSTRAINT "tblInvoice_ThirdpartyType_fkey"
    FOREIGN KEY ("ThirdpartyType") REFERENCES "public"."django_content_type" ("id");

--
-- TOC entry 5006 (class 2606 OID 40006)
-- Name: tblInvoice_UserCreatedUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoice"
    ADD CONSTRAINT "tblInvoice_UserCreatedUUID_fkey"
    FOREIGN KEY ("UserCreatedUUID") REFERENCES "public"."core_User" ("id");

--
-- TOC entry 5007 (class 2606 OID 40007)
-- Name: tblInvoice_UserUpdatedUUID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoice"
    ADD CONSTRAINT "tblInvoice_UserUpdatedUUID_fkey"
    FOREIGN KEY ("UserUpdatedUUID") REFERENCES "public"."core_User" ("id");

--
-- TOC entry 5008 (class 1259 OID 40008)
-- Name: idx_tblInvoice_UserCreatedUUID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblInvoice_UserCreatedUUID"
    ON "public"."tblInvoice" ("UserCreatedUUID");

--
-- TOC entry 5009 (class 1259 OID 40009)
-- Name: idx_tblInvoice_UserUpdatedUUID; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblInvoice_UserUpdatedUUID"
    ON "public"."tblInvoice" ("UserUpdatedUUID");

--
-- TOC entry 5010 (class 1259 OID 40010)
-- Name: idx_tblInvoice_ThirdpartyType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblInvoice_ThirdpartyType"
    ON "public"."tblInvoice" ("ThirdpartyType");

--
-- TOC entry 5011 (class 1259 OID 40011)
-- Name: idx_tblInvoice_SubjectType; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx_tblInvoice_SubjectType"
    ON "public"."tblInvoice" ("SubjectType");


--
-- TOC entry 5012 (class 1259 OID 40020)
-- Name: tblInvoiceLineItem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblInvoiceLineItem" (
    "UUID" "uuid" NOT NULL,
    "isDeleted" boolean NOT NULL,
    "Json_ext" text,
    "DateCreated" timestamp with time zone,
    "DateUpdated" timestamp with time zone,
    "version" integer NOT NULL,
    "DateValidFrom" timestamp with time zone NOT NULL,
    "DateValidTo" timestamp with time zone,
    "ReplacementUUID" "uuid",
    "Code" varchar(255) NOT NULL,
    "Description" text,
    "Details" text,
    "LedgerAccount" varchar(255),
    "Quantity" integer NOT NULL,
    "UnitPrice" numeric(18,2) NOT NULL,
    "Discount" numeric(18,2) NOT NULL,
    "CalculationUUID" "uuid",
    "TaxAnalysis" text,
    "AmountTotal" numeric(18,2) NOT NULL,
    "AmountNet" numeric(18,2) NOT NULL,
    "LineId" varchar(255),
    "InvoiceId" "uuid" NOT NULL,
    "LineType" integer,
    "UserCreatedUUID" "uuid" NOT NULL,
    "UserUpdatedUUID" "uuid" NOT NULL
);

--
-- TOC entry 5013 (class 2606 OID 40021)
-- Name: tblInvoiceLineItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_pkey" PRIMARY KEY ("UUID");

--
-- JSON validation constraints
--

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_Details_check"
    CHECK (jsonb_typeof(to_jsonb("Details"::text)) IS NOT NULL);

-- ALTER TABLE ONLY "public"."tblInvoiceLineItem"
--     ADD CONSTRAINT "tblInvoiceLineItem_Json_ext_check"
--     CHECK (jsonb_typeof(to_jsonb("Json_ext"::text)) IS NOT NULL);

-- ALTER TABLE ONLY "public"."tblInvoiceLineItem"
--     ADD CONSTRAINT "tblInvoiceLineItem_TaxAnalysis_check"
--     CHECK (jsonb_typeof(to_jsonb("TaxAnalysis"::text)) IS NOT NULL);

--
-- Foreign Keys
--

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_InvoiceId_fkey"
    FOREIGN KEY ("InvoiceId") REFERENCES "public"."tblInvoice" ("UUID");

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_LineType_fkey"
    FOREIGN KEY ("LineType") REFERENCES "public"."django_content_type" ("id");

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_UserCreatedUUID_fkey"
    FOREIGN KEY ("UserCreatedUUID") REFERENCES "public"."core_User" ("id");

ALTER TABLE ONLY "public"."tblInvoiceLineItem"
    ADD CONSTRAINT "tblInvoiceLineItem_UserUpdatedUUID_fkey"
    FOREIGN KEY ("UserUpdatedUUID") REFERENCES "public"."core_User" ("id");

--
-- Indexes
--

CREATE INDEX "idx_tblInvoiceLineItem_LineType"
    ON "public"."tblInvoiceLineItem" ("LineType");

CREATE INDEX "idx_tblInvoiceLineItem_UserCreatedUUID"
    ON "public"."tblInvoiceLineItem" ("UserCreatedUUID");

CREATE INDEX "idx_tblInvoiceLineItem_UserUpdatedUUID"
    ON "public"."tblInvoiceLineItem" ("UserUpdatedUUID");

CREATE INDEX "idx_tblInvoiceLineItem_InvoiceId"
    ON "public"."tblInvoiceLineItem" ("InvoiceId");


--
-- TOC entry 5014 (class 1259 OID 40060)
-- Name: tblPaymentPlan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPaymentPlan" (
    "UUID" uuid NOT NULL,
    "isDeleted" boolean NOT NULL,
    "Json_ext" text,
    "DateCreated" timestamp with time zone,
    "DateUpdated" timestamp with time zone,
    "version" integer NOT NULL,
    "DateValidFrom" timestamp with time zone NOT NULL,
    "DateValidTo" timestamp with time zone,
    "ReplacementUUID" uuid,
    "Code" varchar(255),
    "Name" varchar(255),
    "calculationUUID" uuid NOT NULL,
    "Periodicity" integer NOT NULL,
    "UserCreatedUUID" uuid NOT NULL,
    "UserUpdatedUUID" uuid NOT NULL,
    "BenefitPlanID" varchar(255),
    "BenefitPlanType" integer
);

--
-- TOC entry 5015 (class 2606 OID 40061)
-- Name: tblPaymentPlan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPaymentPlan"
    ADD CONSTRAINT "tblPaymentPlan_pkey" PRIMARY KEY ("UUID");

--
-- JSON validation constraint
--

ALTER TABLE ONLY "public"."tblPaymentPlan"
    ADD CONSTRAINT "tblPaymentPlan_Json_ext_check"
    CHECK (jsonb_typeof(to_jsonb("Json_ext"::text)) IS NOT NULL);

--
-- Foreign Keys
--

ALTER TABLE ONLY "public"."tblPaymentPlan"
    ADD CONSTRAINT "tblPaymentPlan_BenefitPlanType_fkey"
    FOREIGN KEY ("BenefitPlanType") REFERENCES "public"."django_content_type" ("id");

ALTER TABLE ONLY "public"."tblPaymentPlan"
    ADD CONSTRAINT "tblPaymentPlan_UserCreatedUUID_fkey"
    FOREIGN KEY ("UserCreatedUUID") REFERENCES "public"."core_User" ("id");

ALTER TABLE ONLY "public"."tblPaymentPlan"
    ADD CONSTRAINT "tblPaymentPlan_UserUpdatedUUID_fkey"
    FOREIGN KEY ("UserUpdatedUUID") REFERENCES "public"."core_User" ("id");

--
-- Indexes
--

CREATE INDEX "idx_tblPaymentPlan_UserCreatedUUID"
    ON "public"."tblPaymentPlan" ("UserCreatedUUID");

CREATE INDEX "idx_tblPaymentPlan_UserUpdatedUUID"
    ON "public"."tblPaymentPlan" ("UserUpdatedUUID");

CREATE INDEX "idx_tblPaymentPlan_BenefitPlanType"
    ON "public"."tblPaymentPlan" ("BenefitPlanType");


--
-- TOC entry XXXX (class 1259 OID XXXXX)
-- Name: product_ProductMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."product_ProductMutation" (
    "id" uuid NOT NULL,
    "mutation_id" uuid NOT NULL,
    "product_id" integer NOT NULL
);

--
-- TOC entry XXXX (class 2606 OID XXXXX)
-- Name: product_ProductMutation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."product_ProductMutation"
    ADD CONSTRAINT "product_ProductMutation_pkey" PRIMARY KEY ("id");

--
-- TOC entry XXXX (class 2606 OID XXXXX)
-- Name: product_ProductMutation_mutation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."product_ProductMutation"
    ADD CONSTRAINT "product_ProductMutation_mutation_id_fkey"
    FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log" ("id");

--
-- TOC entry XXXX (class 2606 OID XXXXX)
-- Name: product_ProductMutation_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."product_ProductMutation"
    ADD CONSTRAINT "product_ProductMutation_product_id_fkey"
    FOREIGN KEY ("product_id") REFERENCES "public"."tblProduct" ("ProdID");

--
-- Indexes
--

CREATE INDEX "idx_product_ProductMutation_product_id"
    ON "public"."product_ProductMutation" ("product_id");

CREATE INDEX "idx_product_ProductMutation_mutation_id"
    ON "public"."product_ProductMutation" ("mutation_id");



------------------------------------------- Others fields ------------------------------

ALTER TABLE "public"."tblUsers"
    ADD COLUMN "LastLogin" timestamp with time zone;

ALTER TABLE "public"."tblLocations"
    ADD COLUMN "JsonExt" text;

ALTER TABLE "public"."tblHF"
    ADD COLUMN "JsonExt" text,
    ADD COLUMN "BankName" text,
    ADD COLUMN "ContractStartDate" date NULL,
    ADD COLUMN "ContractEndDate" date NULL,
    ADD COLUMN "status" VARCHAR(2) NOT NULL DEFAULT 'AC';

ALTER TABLE "public"."tblInsuree"
    ADD COLUMN "JsonExt" text,
    ADD COLUMN "Dead" boolean DEFAULT FALSE,
    ADD COLUMN "DOD" date NULL,
    ADD COLUMN "DeathReason" varchar(500),
    ADD COLUMN "status" varchar(2) DEFAULT 'AC',
    ADD COLUMN "status_date" date,
    ADD COLUMN "StatusReason" integer;

ALTER TABLE "public"."tblFamilies"
    ADD COLUMN "JsonExt" text;

ALTER TABLE "public"."tblConfirmationTypes"
    ADD COLUMN "is_confirmation_number_required" boolean DEFAULT FALSE;

ALTER TABLE "public"."core_Mutation_Log"
    ADD COLUMN "JsonExt" text,
    ADD COLUMN "autogenerated_code" text;

ALTER TABLE "public"."tblPolicy"
    ADD COLUMN "creationDate" date DEFAULT now() NULL,
    ADD COLUMN "policyNumber" character varying(50) NULL;

ALTER TABLE "public"."tblOfficer" 
    ADD COLUMN "JsonExt" text;

ALTER TABLE "public"."tblProduct"
    ADD COLUMN "program" integer NULL,
    ADD COLUMN "CeilingType" character(1) NULL,
    ADD COLUMN "Max Age" integer NULL,
    ADD COLUMN "Min Age" integer NULL;

ALTER TABLE "public"."tblProduct"
    ADD CONSTRAINT "product_program_id_fkey"
    FOREIGN KEY ("program") REFERENCES "public"."tblProgram" ("idProgram")
    ON DELETE NO ACTION;

ALTER TABLE "public"."tblPremium"
    ADD COLUMN "AllDetailsCommissionReport" timestamp with time zone NULL,
    ADD COLUMN "OverviewCommissionReport" timestamp with time zone NULL,
    ADD COLUMN "ReportingCommissionID" integer NULL;

ALTER TABLE "public"."tblPremium"
    DROP COLUMN "RowID";

ALTER TABLE "public"."tblPremium"
    ALTER COLUMN "CreatedDate" SET DEFAULT now();

ALTER TABLE "public"."tblClaim"
    ADD COLUMN "program" integer NULL,
    ADD COLUMN "CareType" character varying(4) NULL,
    ADD COLUMN "TDRResult" boolean NULL,
    ADD COLUMN "TestNumber" character varying(255) NULL,
    ADD COLUMN "JsonExt" text,
    ADD COLUMN "RestoredClaim" integer NULL,
    ADD COLUMN "ReferFrom" INTEGER NULL,
    ADD COLUMN "ReferTo" INTEGER NULL;

ALTER TABLE "public"."tblClaim"
    ADD CONSTRAINT "claim_referfrom_id_fkey"
    FOREIGN KEY ("ReferFrom") REFERENCES "public"."tblHF" ("HfID") ON DELETE NO ACTION;

ALTER TABLE "public"."tblClaim"
    ADD CONSTRAINT "claim_referto_id_fkey"
    FOREIGN KEY ("ReferTo") REFERENCES "public"."tblHF" ("HfID") ON DELETE NO ACTION;


ALTER TABLE "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_program_fkey"
    FOREIGN KEY ("program") REFERENCES "public"."tblProgram" ("idProgram") ON DELETE NO ACTION;
ALTER TABLE "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_restoredclaim_fkey"
    FOREIGN KEY ("RestoredClaim") REFERENCES "public"."tblClaim" ("ClaimID") ON DELETE NO ACTION;

ALTER TABLE "public"."tblClaim"
    ALTER COLUMN "ClaimCode" TYPE character varying(40);

CREATE INDEX "IX_tblClaim_code_insuree_uuid_status"
    ON "public"."tblClaim" ("ClaimCode", "ClaimStatus");

ALTER TABLE "public"."tblFeedback"
    ADD COLUMN "Age" smallint NULL,
    ADD COLUMN "MeansInformation" character varying(25) NULL,
    ADD COLUMN "PolicyNational" boolean NULL,
    ADD COLUMN "Pregnant" boolean NULL,
    ADD COLUMN "Sexe" character varying(15) NULL;

-- ALTER TABLE "public"."tblFeedback"
--     ALTER COLUMN "Asessment" TYPE integer;

ALTER TABLE "public"."tblFeedbackPrompt"
    ALTER COLUMN "PhoneNumber" TYPE character varying(50);

ALTER TABLE "public"."tblFeedbackPrompt"
    DROP CONSTRAINT IF EXISTS "tblFeedbackPrompt_officer_id_fkey";

ALTER TABLE "public"."tblFeedbackPrompt"
    ADD CONSTRAINT "tblFeedbackPrompt_officer_fkey"
    FOREIGN KEY ("OfficerID") REFERENCES "public"."tblOfficer" ("OfficerID") ON DELETE NO ACTION;

ALTER TABLE "public"."tblFeedbackPrompt"
    DROP CONSTRAINT IF EXISTS "tblFeedbackPrompt_claim_id_fkey";

ALTER TABLE "public"."tblFeedbackPrompt"
    ADD CONSTRAINT "tblFeedbackPrompt_claim_fkey"
    FOREIGN KEY ("ClaimID") REFERENCES "public"."tblClaim" ("ClaimID") ON DELETE NO ACTION;

ALTER TABLE "public"."tblFeedbackPrompt"
    RENAME COLUMN "OfficerID" TO "officer";

ALTER TABLE "public"."tblFeedbackPrompt"
    RENAME COLUMN "ClaimID" TO "claim";

-- ALTER TABLE "public"."tblClaimAttachment"
--     ADD COLUMN "general_type" character varying(4) DEFAULT 'FILE' NOT NULL,
--     ADD COLUMN "module" text NULL;

ALTER TABLE "public"."tblServices"
    ADD COLUMN "ServPackageType" character varying(1) DEFAULT 'S',
    ADD COLUMN "MaximumAmount" numeric(18,2),
    ADD COLUMN "program" integer NULL,
    ADD COLUMN "health_facility" integer NULL,
    ADD COLUMN "manualPrice" boolean NOT NULL DEFAULT FALSE;


ALTER TABLE "public"."tblServices"
    ALTER COLUMN "ValidityFrom" SET DEFAULT now(),
    ADD CONSTRAINT "tblServices_program_id_fkey"
    FOREIGN KEY ("program") REFERENCES "public"."tblProgram" ("idProgram") ON DELETE NO ACTION;
ALTER TABLE "public"."tblServices"
    ADD CONSTRAINT "tblServices_health_facility_fkey"
    FOREIGN KEY ("health_facility") REFERENCES "public"."tblHF" ("HfID") ON DELETE NO ACTION;

DROP VIEW IF EXISTS public."uvwServiceUtilization";
DROP VIEW IF EXISTS public."uvwServiceExpenditures";

ALTER TABLE "public"."tblServices"
    ALTER COLUMN "ServCode" TYPE character varying(20);

ALTER TABLE "public"."tblItems"
    ADD COLUMN "MaximumAmount" numeric(18,2),
    ADD COLUMN "program" integer NULL,
    ADD COLUMN "health_facility" integer NULL;

ALTER TABLE "public"."tblItems"
    ALTER COLUMN "MaximumAmount" DROP NOT NULL;

-- Contraintes FK
ALTER TABLE "public"."tblItems"
    ADD CONSTRAINT "tblItems_program_id_fkey"
    FOREIGN KEY ("program") REFERENCES "public"."tblProgram" ("idProgram") ON DELETE NO ACTION;

ALTER TABLE "public"."tblItems"
    ADD CONSTRAINT "tblItems_health_facility_fkey"
    FOREIGN KEY ("health_facility") REFERENCES "public"."tblHF" ("HfID") ON DELETE NO ACTION;

ALTER TABLE "public"."tblClaimServices"
    ADD COLUMN "JsonExt" text;

ALTER TABLE "public"."tblClaimItems"
    ADD COLUMN "JsonExt" text;

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

--------- resetting or synchronizing a sequence
SELECT setval('"public"."tblChequeSanteImport_ChequeImportID_seq"', (SELECT COALESCE(MAX("ChequeImportID"), 1) FROM "public"."tblChequeSanteImport"), true);
SELECT setval('"public"."tblChequeSanteImportLine_idChequeImportLine_seq"', (SELECT COALESCE(MAX("idChequeImportLine"), 1) FROM "public"."tblChequeSanteImportLine"), true);
SELECT setval('"public"."cheque_updated_history_ChequeUpdatedID_seq"', (SELECT COALESCE(MAX("ChequeUpdatedID"), 1) FROM "public"."cheque_updated_history"), true);
SELECT setval('"public"."tblProgram_idProgram_seq"', (SELECT COALESCE(MAX("idProgram"), 1) FROM "public"."tblProgram"), true);


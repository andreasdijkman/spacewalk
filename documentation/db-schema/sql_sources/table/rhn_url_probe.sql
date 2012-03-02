-- created by Oraschemadoc Fri Mar  2 05:57:15 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_URL_PROBE" 
   (	"USERNAME" VARCHAR2(40), 
	"PASSWORD" VARCHAR2(255), 
	"COOKIE_ENABLED" CHAR(1) DEFAULT (0) NOT NULL ENABLE, 
	"MULTI_STEP" CHAR(1) DEFAULT (0) NOT NULL ENABLE, 
	"RUN_ON_SCOUTS" CHAR(1) DEFAULT ('1') NOT NULL ENABLE, 
	"PROBE_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"PROBE_TYPE" VARCHAR2(12) DEFAULT ('url') NOT NULL ENABLE, 
	"SAT_CLUSTER_ID" NUMBER(12,0), 
	"SCOUT_WARNING_THRESHOLD_IS_ALL" CHAR(1) DEFAULT ('1') NOT NULL ENABLE, 
	"SCOUT_CRIT_THRESHOLD_IS_ALL" CHAR(1) DEFAULT ('1') NOT NULL ENABLE, 
	"SCOUT_WARNING_THRESHOLD" NUMBER(12,0) DEFAULT (-1), 
	"SCOUT_CRITICAL_THRESHOLD" NUMBER(12,0) DEFAULT (-1), 
	 CONSTRAINT "RHN_URLPB_MULTI_STEP_CK" CHECK (multi_step in ('0','1')) ENABLE, 
	 CONSTRAINT "RHN_URLPB_RUN_ON_SCOUTS_CK" CHECK (run_on_scouts in ('0','1')) ENABLE, 
	 CONSTRAINT "RHN_URLPB_PROBE_TYPE_CK" CHECK (probe_type='url') ENABLE, 
	 CONSTRAINT "RHN_URLPB_PROBE_ID_PK" PRIMARY KEY ("PROBE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_URLPB_PROBE_PR_ID_PR_FK" FOREIGN KEY ("PROBE_ID", "PROBE_TYPE")
	  REFERENCES "SPACEWALK"."RHN_PROBE" ("RECID", "PROBE_TYPE") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

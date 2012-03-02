-- created by Oraschemadoc Fri Mar  2 05:57:12 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_PROBE" 
   (	"RECID" NUMBER NOT NULL ENABLE, 
	"PROBE_TYPE" VARCHAR2(15) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(255) NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"COMMAND_ID" NUMBER(16,0) NOT NULL ENABLE, 
	"CONTACT_GROUP_ID" NUMBER(12,0), 
	"NOTIFY_CRITICAL" CHAR(1), 
	"NOTIFY_WARNING" CHAR(1), 
	"NOTIFY_UNKNOWN" CHAR(1), 
	"NOTIFY_RECOVERY" CHAR(1), 
	"NOTIFICATION_INTERVAL_MINUTES" NUMBER(16,0) NOT NULL ENABLE, 
	"CHECK_INTERVAL_MINUTES" NUMBER(16,0) NOT NULL ENABLE, 
	"RETRY_INTERVAL_MINUTES" NUMBER(16,0) NOT NULL ENABLE, 
	"MAX_ATTEMPTS" NUMBER(16,0), 
	"LAST_UPDATE_USER" VARCHAR2(40), 
	"LAST_UPDATE_DATE" DATE, 
	 CONSTRAINT "RHN_PROBE_RECID_PK" PRIMARY KEY ("RECID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_PROBE_RECID_PROBE_TYPE_UQ" UNIQUE ("RECID", "PROBE_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_PROBE_CMMND_COMMAND_ID_FK" FOREIGN KEY ("COMMAND_ID")
	  REFERENCES "SPACEWALK"."RHN_COMMAND" ("RECID") ENABLE, 
	 CONSTRAINT "RHN_PROBE_CSTMR_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_PROBE_PRBTP_PROBE_TYPE_FK" FOREIGN KEY ("PROBE_TYPE")
	  REFERENCES "SPACEWALK"."RHN_PROBE_TYPES" ("PROBE_TYPE") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

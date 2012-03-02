-- created by Oraschemadoc Fri Mar  2 05:57:12 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_REDIRECTS" 
   (	"RECID" NUMBER(12,0) NOT NULL ENABLE, 
	"CUSTOMER_ID" NUMBER(12,0), 
	"CONTACT_ID" NUMBER(12,0), 
	"REDIRECT_TYPE" VARCHAR2(20) NOT NULL ENABLE, 
	"DESCRIPTION" VARCHAR2(25), 
	"REASON" VARCHAR2(2000), 
	"EXPIRATION" DATE NOT NULL ENABLE, 
	"LAST_UPDATE_USER" VARCHAR2(40), 
	"LAST_UPDATE_DATE" DATE, 
	"START_DATE" DATE NOT NULL ENABLE, 
	"RECURRING" NUMBER(12,0) DEFAULT (0) NOT NULL ENABLE, 
	"RECURRING_FREQUENCY" NUMBER(12,0) DEFAULT (2), 
	"RECURRING_DURATION" NUMBER(12,0) DEFAULT (0), 
	"RECURRING_DUR_TYPE" NUMBER(12,0) DEFAULT (12), 
	 CONSTRAINT "RHN_RDRCT_RECID_PK" PRIMARY KEY ("RECID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_RDRCT_START_LTE_EXPIR" CHECK (start_date <= expiration ) ENABLE, 
	 CONSTRAINT "RHN_RDRCT_RECUR_VALID" CHECK (recurring in (0, 1)) ENABLE, 
	 CONSTRAINT "RHN_RDRCT_RECUR_FREQ_VALID" CHECK (recurring_frequency in (2,3,6)) ENABLE, 
	 CONSTRAINT "RHN_RDRCT_REC_DTYPE_VALID" CHECK ( recurring_dur_type in (12,11,5,3,1) ) ENABLE, 
	 CONSTRAINT "RHN_RDRCT_CNTCT_CONTACT_ID_FK" FOREIGN KEY ("CONTACT_ID")
	  REFERENCES "SPACEWALK"."WEB_CONTACT" ("ID") ENABLE, 
	 CONSTRAINT "RHN_RDRCT_CSTMR_CUSTOMER_ID_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "SPACEWALK"."WEB_CUSTOMER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_RDRCT_RDRTP_REDIR_TYPE_FK" FOREIGN KEY ("REDIRECT_TYPE")
	  REFERENCES "SPACEWALK"."RHN_REDIRECT_TYPES" ("NAME") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

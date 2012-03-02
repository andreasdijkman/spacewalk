-- created by Oraschemadoc Fri Mar  2 05:56:53 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSATELLITEINFO" 
   (	"SERVER_ID" NUMBER NOT NULL ENABLE, 
	"EVR_ID" NUMBER, 
	"CERT" BLOB NOT NULL ENABLE, 
	"PRODUCT" VARCHAR2(256) NOT NULL ENABLE, 
	"OWNER" VARCHAR2(256) NOT NULL ENABLE, 
	"ISSUED_STRING" VARCHAR2(256), 
	"EXPIRATION_STRING" VARCHAR2(256), 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SATELLITE_INFO_SID_UQ" UNIQUE ("SERVER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_SATELLITE_INFO_SID_FK" FOREIGN KEY ("SERVER_ID")
	  REFERENCES "SPACEWALK"."RHNSERVER" ("ID") ENABLE, 
	 CONSTRAINT "RHN_SATELLITE_INFO_EID_FK" FOREIGN KEY ("EVR_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGEEVR" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CERT") STORE AS (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)) ENABLE ROW MOVEMENT 
 
/

-- created by Oraschemadoc Fri Mar  2 05:56:49 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNPACKAGEKEY" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"KEY_ID" VARCHAR2(64) NOT NULL ENABLE, 
	"KEY_TYPE_ID" NUMBER NOT NULL ENABLE, 
	"PROVIDER_ID" NUMBER, 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_PKEY_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_PKEY_KEYID_UQ" UNIQUE ("KEY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_PKEY_TYPE_ID_PRID_FK" FOREIGN KEY ("KEY_TYPE_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGEKEYTYPE" ("ID") ENABLE, 
	 CONSTRAINT "RHN_PKEY_PRID_FK" FOREIGN KEY ("PROVIDER_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGEPROVIDER" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/

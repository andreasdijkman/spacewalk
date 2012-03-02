-- created by Oraschemadoc Fri Mar  2 05:57:13 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHN_REDIRECT_GROUP_TARGETS" 
   (	"REDIRECT_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"CONTACT_GROUP_ID" NUMBER(12,0) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_RDRGT_PK" PRIMARY KEY ("REDIRECT_ID", "CONTACT_GROUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_RDRGT_RDRCT_REDIRECT_ID_FK" FOREIGN KEY ("REDIRECT_ID")
	  REFERENCES "SPACEWALK"."RHN_REDIRECTS" ("RECID") ON DELETE CASCADE ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

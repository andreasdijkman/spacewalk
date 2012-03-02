-- created by Oraschemadoc Fri Mar  2 05:56:57 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSERVERNOTES" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CREATOR" NUMBER, 
	"SERVER_ID" NUMBER NOT NULL ENABLE, 
	"SUBJECT" VARCHAR2(80) NOT NULL ENABLE, 
	"NOTE" VARCHAR2(4000), 
	"CREATED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	"MODIFIED" DATE DEFAULT (sysdate) NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SERVERNOTES_ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "RHN_SERVERNOTES_CREATOR_FK" FOREIGN KEY ("CREATOR")
	  REFERENCES "SPACEWALK"."WEB_CONTACT" ("ID") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "RHN_SERVERNOTES_SID_FK" FOREIGN KEY ("SERVER_ID")
	  REFERENCES "SPACEWALK"."RHNSERVER" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

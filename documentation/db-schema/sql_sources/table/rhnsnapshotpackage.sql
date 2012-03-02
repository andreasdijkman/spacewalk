-- created by Oraschemadoc Fri Mar  2 05:56:59 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."RHNSNAPSHOTPACKAGE" 
   (	"SNAPSHOT_ID" NUMBER NOT NULL ENABLE, 
	"NEVRA_ID" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "RHN_SNAPSHOTPKG_SID_FK" FOREIGN KEY ("SNAPSHOT_ID")
	  REFERENCES "SPACEWALK"."RHNSNAPSHOT" ("ID") ON DELETE CASCADE ENABLE, 
	 CONSTRAINT "RHN_SNAPSHOTPKG_NID_FK" FOREIGN KEY ("NEVRA_ID")
	  REFERENCES "SPACEWALK"."RHNPACKAGENEVRA" ("ID") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ENABLE ROW MOVEMENT 
 
/

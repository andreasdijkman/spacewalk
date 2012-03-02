-- created by Oraschemadoc Fri Mar  2 05:56:30 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE TABLE "SPACEWALK"."QRTZ_SIMPLE_TRIGGERS" 
   (	"TRIGGER_NAME" VARCHAR2(200) NOT NULL ENABLE, 
	"TRIGGER_GROUP" VARCHAR2(200) NOT NULL ENABLE, 
	"REPEAT_COUNT" NUMBER(7,0) NOT NULL ENABLE, 
	"REPEAT_INTERVAL" NUMBER(12,0) NOT NULL ENABLE, 
	"TIMES_TRIGGERED" NUMBER(10,0) NOT NULL ENABLE, 
	 PRIMARY KEY ("TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 FOREIGN KEY ("TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "SPACEWALK"."QRTZ_TRIGGERS" ("TRIGGER_NAME", "TRIGGER_GROUP") ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/

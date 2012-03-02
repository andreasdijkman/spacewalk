-- created by Oraschemadoc Fri Mar  2 05:57:18 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE INDEX "SPACEWALK"."IDX_QRTZ_T_STATE" ON "SPACEWALK"."QRTZ_TRIGGERS" ("TRIGGER_STATE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" 
 
/

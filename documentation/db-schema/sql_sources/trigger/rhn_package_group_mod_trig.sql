-- created by Oraschemadoc Fri Mar  2 05:58:07 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_PACKAGE_GROUP_MOD_TRIG" 
before insert or update on rhnPackageGroup
for each row
begin
        :new.modified := sysdate;
end;
ALTER TRIGGER "SPACEWALK"."RHN_PACKAGE_GROUP_MOD_TRIG" ENABLE
 
/

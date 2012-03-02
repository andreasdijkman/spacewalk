-- created by Oraschemadoc Fri Mar  2 05:58:06 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE TRIGGER "SPACEWALK"."RHN_ERRATA_MOD_TRIG" 
before insert or update on rhnErrata
for each row
begin
     if ( :new.last_modified = :old.last_modified ) or
        ( :new.last_modified is null )  then
        :new.last_modified := sysdate;
     end if;

	  	:new.modified := sysdate;
end rhn_errata_mod_trig;
ALTER TRIGGER "SPACEWALK"."RHN_ERRATA_MOD_TRIG" ENABLE
 
/

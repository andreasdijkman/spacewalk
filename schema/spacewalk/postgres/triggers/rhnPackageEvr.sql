-- oracle equivalent source sha1 29db6b12e1a4be368e51eab0cc58f1208357c6c0

create trigger
rhn_pack_evr_no_updel_trig
before update or delete on rhnPackageEvr
execute procedure no_operation_trig_fun();

create or replace function rhn_pevr_set_modular_trig_fun() returns trigger as
$$
begin
	if lower(new.release) like '%module+%' then
	   new.modular = 1;
	end if;
       
	return new;
end;
$$ language plpgsql;

create trigger
rhn_pevr_set_modular_trig 
before insert on rhnPackageEvr
for each row
execute procedure rhn_pevr_set_modular_trig_fun();

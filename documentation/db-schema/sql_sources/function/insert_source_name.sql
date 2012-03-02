-- created by Oraschemadoc Fri Mar  2 05:58:11 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE FUNCTION "SPACEWALK"."INSERT_SOURCE_NAME" (name_in in varchar2)
return number
is
    pragma autonomous_transaction;
    source_id   number;
begin
    insert into rhnSourceRPM(id, name)
    values (rhn_sourcerpm_id_seq.nextval, name_in) returning id into source_id;
    commit;
    return source_id;
end;
 
/

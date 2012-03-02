-- created by Oraschemadoc Fri Mar  2 05:58:03 2012
-- visit http://www.yarpen.cz/oraschemadoc/ for more info

  CREATE OR REPLACE FORCE VIEW "SPACEWALK"."RHNVISIBLESERVERGROUP" ("ID", "NAME", "DESCRIPTION", "MAX_MEMBERS", "CURRENT_MEMBERS", "GROUP_TYPE", "ORG_ID", "CREATED", "MODIFIED") AS 
  SELECT "ID","NAME","DESCRIPTION","MAX_MEMBERS","CURRENT_MEMBERS","GROUP_TYPE","ORG_ID","CREATED","MODIFIED"
    FROM rhnServerGroup SG
   WHERE SG.group_type IS NULL
 
/

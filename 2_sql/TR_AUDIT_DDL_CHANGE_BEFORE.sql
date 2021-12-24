--------------------------------------------------------
--  DDL for Trigger TR_AUDIT_DDL_CHANGE_BEFORE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TEST_USER"."TR_AUDIT_DDL_CHANGE_BEFORE" before update or delete
ON audit_ddl_change
referencing old as old new as new
for each row
declare
begin
  raise_application_error(-20000, 'Запрещено модифицировать таблицу аудита AUDIT_DDL_CHANGE'); 
end;



/
ALTER TRIGGER "TEST_USER"."TR_AUDIT_DDL_CHANGE_BEFORE" ENABLE;

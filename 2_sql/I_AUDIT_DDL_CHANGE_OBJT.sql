--------------------------------------------------------
--  DDL for Index I_AUDIT_DDL_CHANGE_OBJT
--------------------------------------------------------

  CREATE INDEX "TEST_USER"."I_AUDIT_DDL_CHANGE_OBJT" ON "TEST_USER"."AUDIT_DDL_CHANGE" ("OBJECT_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA" ;

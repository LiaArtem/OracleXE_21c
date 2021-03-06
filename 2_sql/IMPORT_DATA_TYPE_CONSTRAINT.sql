--------------------------------------------------------
--  Constraints for Table IMPORT_DATA_TYPE
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" MODIFY ("TYPE_OPER" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" MODIFY ("DATA_TYPE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" ADD CONSTRAINT "IMPORT_DATA_TYPE_CHK" CHECK (DATA_TYPE in ('xml','json','csv')) ENABLE;
  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" ADD CONSTRAINT "IMPORT_DATA_TYPE_CHK_JSON" CHECK (DATA_JSON_OLD IS JSON) ENABLE;
  ALTER TABLE "TEST_USER"."IMPORT_DATA_TYPE" ADD CONSTRAINT "IMPORT_DATA_TYPE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA"  ENABLE;

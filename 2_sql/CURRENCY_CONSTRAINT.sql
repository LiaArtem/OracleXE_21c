--------------------------------------------------------
--  Constraints for Table CURRENCY
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."CURRENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."CURRENCY" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."CURRENCY" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."CURRENCY" MODIFY ("SHORT_NAME" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."CURRENCY" ADD CONSTRAINT "CURRENCY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA"  ENABLE;

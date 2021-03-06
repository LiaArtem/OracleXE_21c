--------------------------------------------------------
--  Constraints for Table ISIN_SECUR
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."ISIN_SECUR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."ISIN_SECUR" MODIFY ("ISIN" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."ISIN_SECUR" ADD CONSTRAINT "ISIN_SECUR_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA"  ENABLE;
  ALTER TABLE "TEST_USER"."ISIN_SECUR" ADD CONSTRAINT "ISIN_SECUR_UK" UNIQUE ("ISIN")
  USING INDEX "TEST_USER"."ISIN_SECUR_UK"  ENABLE;

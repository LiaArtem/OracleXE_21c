--------------------------------------------------------
--  Constraints for Table KURS
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."KURS" MODIFY ("KURS_DATE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."KURS" MODIFY ("CURRENCY_CODE" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."KURS" ADD CONSTRAINT "PK_KURS" PRIMARY KEY ("ID")
  USING INDEX "TEST_USER"."PK_KURS"  ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table ISIN_SECUR_PAY
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."ISIN_SECUR_PAY" ADD CONSTRAINT "ISIN_SECUR_PAY_FK" FOREIGN KEY ("ISIN_SECUR_ID")
	  REFERENCES "TEST_USER"."ISIN_SECUR" ("ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Constraints for Table AUDIT_DDL_CHANGE
--------------------------------------------------------

  ALTER TABLE "TEST_USER"."AUDIT_DDL_CHANGE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TEST_USER"."AUDIT_DDL_CHANGE" ADD CONSTRAINT "PK_AUDIT_DDL_CHANGE" PRIMARY KEY ("ID")
  USING INDEX "TEST_USER"."PK_AUDIT_DDL_CHANGE"  ENABLE;

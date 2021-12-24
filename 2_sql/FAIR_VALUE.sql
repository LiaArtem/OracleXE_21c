--------------------------------------------------------
--  DDL for Table FAIR_VALUE
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."FAIR_VALUE" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"CALC_DATE" DATE, 
	"ISIN" VARCHAR2(30 CHAR), 
	"CURRENCY_CODE" VARCHAR2(3 CHAR), 
	"FAIR_VALUE" NUMBER(38,15), 
	"YTM" NUMBER(38,15), 
	"CLEAN_RATE" NUMBER(38,15), 
	"COR_COEF" NUMBER(38,15), 
	"MATURITY" DATE, 
	"COR_COEF_CASH" NUMBER(38,15), 
	"NOTIONAL" NUMBER(38,15), 
	"AVR_RATE" NUMBER(38,15), 
	"OPTION_VALUE" NUMBER(38,15), 
	"INTRINSIC_VALUE" NUMBER(38,15), 
	"TIME_VALUE" NUMBER(38,15), 
	"DELTA_PER" NUMBER(38,15), 
	"DELTA_EQU" NUMBER(38,15), 
	"DOP" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA" ;

   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."ID" IS 'ID';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."CALC_DATE" IS 'Дата, на яку розрахована справедлива вартість';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."ISIN" IS 'ISIN';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."CURRENCY_CODE" IS 'Валюта номіналу цінного папера';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."FAIR_VALUE" IS 'Справедлива вартість одного цінного папера з урахуванням накопиченого купонного доходу, у валюті номіналу';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."YTM" IS 'Дохідність до погашення, %';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."CLEAN_RATE" IS 'Курс цінного папера без урахування накопиченого купонного доходу, %';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."COR_COEF" IS 'Коригуючий коефіцієнт';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."MATURITY" IS 'Дата погашення';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."COR_COEF_CASH" IS 'Коригуючий коефіцієнт для операцій з передавання запасів готівки на зберігання до уповноважених банків';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."NOTIONAL" IS 'Умовна сума, доларів США';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."AVR_RATE" IS 'Середньозважений курс на дату оцінки (S), грн. за дол. США';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."OPTION_VALUE" IS 'Розрахункова справедлива вартість деривативу option call, грн.';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."INTRINSIC_VALUE" IS 'у т.ч. внутрішня вартість, грн.';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."TIME_VALUE" IS 'у т.ч. часова вартість, грн. ';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."DELTA_PER" IS 'Дельта опціону (delta)';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."DELTA_EQU" IS 'Чистий еквівалент дельти, дол. США';
   COMMENT ON COLUMN "TEST_USER"."FAIR_VALUE"."DOP" IS 'Опис';
   COMMENT ON TABLE "TEST_USER"."FAIR_VALUE"  IS 'Справедлива вартість ОВДП та коригуючі коефіцієнти';

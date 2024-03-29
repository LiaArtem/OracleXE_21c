--------------------------------------------------------
--  DDL for Table IMPORT_DATA_TYPE
--------------------------------------------------------

  CREATE TABLE "TEST_USER"."IMPORT_DATA_TYPE" 
   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"TYPE_OPER" VARCHAR2(255 CHAR), 
	"DATA_TYPE" VARCHAR2(4 CHAR), 
	"DATA_CLOB" CLOB, 
	"DATA_XML" "SYS"."XMLTYPE" , 
	"DATA_JSON" JSON, 
	"DATA_JSON_OLD" CLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TEST_DATA" 
 LOB ("DATA_CLOB") STORE AS SECUREFILE (
  TABLESPACE "TEST_DATA" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 XMLTYPE COLUMN "DATA_XML" STORE AS SECUREFILE BINARY XML (
  TABLESPACE "TEST_DATA" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  CACHE  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ALLOW NONSCHEMA DISALLOW ANYSCHEMA 
 JSON ("DATA_JSON") STORE AS (
  TABLESPACE "TEST_DATA"  CHUNK 8192
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("DATA_JSON_OLD") STORE AS SECUREFILE (
  TABLESPACE "TEST_DATA" ENABLE STORAGE IN ROW 4000 CHUNK 8192
  CACHE  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 262144 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."TYPE_OPER" IS 'Тип операции';
   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."DATA_TYPE" IS 'Тип данных';
   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."DATA_CLOB" IS 'Данные CLOB';
   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."DATA_XML" IS 'Данные XML';
   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."DATA_JSON" IS 'Данные JSON';
   COMMENT ON COLUMN "TEST_USER"."IMPORT_DATA_TYPE"."DATA_JSON_OLD" IS 'Данные JSON old';
   COMMENT ON TABLE "TEST_USER"."IMPORT_DATA_TYPE"  IS 'Таблица с принятыми данными';

--------------------------------------------------------
--  DDL for Procedure INSERT_KURS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "TEST_USER"."INSERT_KURS" 
(
  P_KURS_DATE IN VARCHAR2
, P_CURRENCY_CODE IN VARCHAR2 
, P_RATE IN NUMBER 
) AS 
BEGIN
    INSERT INTO kurs (ID, KURS_DATE, CURRENCY_CODE, RATE)
	     SELECT KURS_SEQ.nextval,
                TO_DATE(P_KURS_DATE, 'YYYY-MM-DD'), 
                P_CURRENCY_CODE, 
                P_RATE
         FROM dual
        WHERE NOT EXISTS (SELECT 1 FROM kurs c where c.kurs_date = TO_DATE(P_KURS_DATE, 'YYYY-MM-DD') and c.currency_code = P_CURRENCY_CODE);

END INSERT_KURS;



/

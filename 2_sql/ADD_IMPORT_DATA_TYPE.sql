--------------------------------------------------------
--  DDL for Procedure ADD_IMPORT_DATA_TYPE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "TEST_USER"."ADD_IMPORT_DATA_TYPE" (p_type_oper VARCHAR2,
                                                                p_data_type VARCHAR2,
                                                                p_data_value clob
                                                                )
AS 
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
      -- добавить историю данных
      if p_data_type = 'csv'
      then
         insert into import_data_type(type_oper, data_type, data_clob)
           values (p_type_oper, p_data_type, p_data_value);
      elsif p_data_type = 'xml'    
      then
         insert into import_data_type(type_oper, data_type, data_xml)
           values (p_type_oper, p_data_type, xmltype(p_data_value));
           
      elsif p_data_type = 'json' and dbms_lob.getlength(p_data_value) > 2000
      then
         insert into import_data_type(type_oper, data_type, data_json, data_json_old)
           values (p_type_oper, p_data_type, json(p_data_value), null);

      elsif p_data_type = 'json' and dbms_lob.getlength(p_data_value) <= 2000
      then
         insert into import_data_type(type_oper, data_type, data_json, data_json_old)
           values (p_type_oper, p_data_type, json(p_data_value), dbms_lob.substr(p_data_value,2000));
           
      end if;      
      
      commit;
      
--exception when others
--then
   --raise_application_error(-20000, p_data_value, true);  

END ADD_IMPORT_DATA_TYPE;

/

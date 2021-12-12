--------------------------------------------------------
--  DDL for Package P_CHECK
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "TEST_USER"."P_CHECK" 
as

    -- Проверка валидности JSON
    function is_valid_json(p_text clob) return varchar2;

    -- Проверка валидности XML
    function is_valid_xml(p_text clob) return varchar2;    

end;


/

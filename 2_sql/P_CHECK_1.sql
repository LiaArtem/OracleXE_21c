--------------------------------------------------------
--  DDL for Package Body P_CHECK
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "TEST_USER"."P_CHECK" 
as

    -- Проверка валидности JSON
    function is_valid_json(p_text clob) return varchar2
    is
      p_is_valid varchar2(1);
    begin
        select decode(count(*),0,'F','T') into p_is_valid
        from
        (
        select p_text as t
        from dual
        ) tt
        where tt.t is json; -- валидация json

        return p_is_valid;
    end;

    -- Проверка валидности XML
    function is_valid_xml(p_text clob) return varchar2
    is
        p_xml xmltype;
    begin
        p_xml := xmltype(p_text);    
        return 'T';
    exception when others
    then      
        return 'F';
    end;

end;



/

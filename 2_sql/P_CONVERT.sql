--------------------------------------------------------
--  DDL for Package P_CONVERT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "TEST_USER"."P_CONVERT" 
as

  m_userenv varchar2(100) := userenv('language');
  m_base_charset varchar2(50) := substr(m_userenv, instr(m_userenv, '.', 1, 1) + 1,  length(m_userenv));              

  -- Преобразование из base64 (до 32000 символов)
  function base64_decode(p_value varchar2) return varchar2;

  -- Преобразование из base64 (clob)
  function base64_decode_clob(p_payload_clob clob) return clob;

  -- Преобразование в base64 (до 32000 символов)
  function base64_encode(p_value varchar2) return varchar2;

  -- Преобразование в base64 (clob)
  function base64_encode_clob(p_payload_clob clob) return clob;

  -- Преобразование суммы в текст (с валютой)
  function str_amount_curr (p_amount     number,
                            p_curr_code  varchar2 default 'UAH',
                            p_is_decimal char default 'F')
    return varchar2; 

  -- Преобразование суммы в текст
  function str_amount (p_amount number, p_is_default char := 'T') return varchar2;

  -- Преобразование суммы в текстовый формат числа
  function str_amount_format (p_number number, p_count_comma pls_integer default 2) return varchar2;

  -- Преобразование процента с тест (0,5678999% (нуль цiлих i п'ять мiльйонiв шiстсот сiмдесят вiсiм тисяч дев'ятсот дев'яносто дев'ять десятимільйонних процента))
  function str_interest (p_amount number) return varchar2;

  -- Преобразование теста с UTF8 в базовую кодировку Oracle (до 4000 символов)
  function get_charset_utf8(p_text varchar2) return varchar2;

  -- Преобразование теста с базовую кодировки Oracle в UTF8 (до 4000 символов)
  function to_charset_utf8(p_text varchar2) return varchar2;

   -- Экранирование символов для JSON с доп. конвертацией в UTF8
  function screening_json(p_str in varchar2, p_is_convert_utf8 varchar2 default 'F') return varchar2;

  -- Преобразование теста с число
  function str_to_num (p_text in varchar2) return number;

  -- Преобразование теста в дату
  function str_to_date (p_text in varchar2, p_format in VARCHAR2 default 'dd.mm.yyyy') return date;

  -- Преобразование числа в тест
  function num_to_str (p_amount number) return varchar2;  

  -- Преобразование теста из одной в другую кодировку
  -- 'UTF8','CL8MSWIN1251'
  function convert_str(p_text          varchar2, 
                       p_char_set_to   varchar2, -- преобразовать в
                       p_char_set_from varchar2 default null) -- преобразования из
    return varchar2;

  -- Прообразование теста в дату и время (формат YYYY-MM-DDThh24:mi:ssZ)
  function get_datetime(p_text varchar2) return date;

end;

/

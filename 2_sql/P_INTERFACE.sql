--------------------------------------------------------
--  DDL for Package P_INTERFACE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "TEST_USER"."P_INTERFACE" 
as

    -- Справедливая стоимость ЦБ (котировки НБУ)
    -- Получить данные
    -- select f.* from table (p_interface.read_fair_value(p_date => to_date('09.04.2021','dd.mm.yyyy'))) f;    
    function read_fair_value (p_date date) -- дата
      return t_fair_value_table;

    -- Перечень ISIN ЦБ с купонными периодами
    -- Получить данные
    -- select f.* from table (p_interface.read_isin_secur(p_format => 'json')) f;        
    function read_isin_secur (p_format varchar2) -- формат xml, json
      return t_isin_secur_table;

    -- Курсы валют НБУ
    -- Получить данные
    -- select f.* from table (p_interface.read_kurs_nbu(p_date => to_date('09.04.2021','dd.mm.yyyy'), p_format => 'json', p_currency => 'USD')) f;            
    function read_kurs_nbu (p_date date, -- дата курсов
                            p_format varchar2, -- формат xml, json
                            p_currency varchar2 default null -- UAH, USD, EUR
                            ) return t_kurs_nbu_table;

    -- НАИС - поиск контрагента в ЕРД (едином реестре должников)
    -- Получить данные
    -- select f.* from table (p_interface.read_erb_minfin(p_identCode => '33270581', p_type_cust_code => '2')) f;    
    -- select f.* from table (p_interface.read_erb_minfin(p_identCode => '2985108376', p_type_cust_code => '1')) f;
    -- select f.* from table (p_interface.read_erb_minfin(p_lastName       => 'Бондарчук',
    --                                                    p_firstName      => 'Ігор',
    --                                                    p_middleName     => 'Володимирович',
    --                                                    p_birthDate      => to_date('23.09.1981','dd.mm.yyyy'),
    --                                                    p_type_cust_code => '1')) f;
    function read_erb_minfin (p_categoryCode   varchar2 default null, -- пусто все, 03 - аллименты
                              p_identCode      varchar2 default null,
                              p_lastName       varchar2 default null,
                              p_firstName      varchar2 default null,
                              p_middleName     varchar2 default null,
                              p_birthDate      date     default null,
                              p_type_cust_code varchar2 -- (1 - физ., 2 - юр.)
                              ) return t_erb_minfin_table;

   -- Справедливая стоимость ЦБ (котировки НБУ)    
   procedure add_fair_value (p_date date);

   -- Курсы валют НБУ   
   procedure add_kurs_nbu (p_date date, p_currency_code varchar2);

-- Перечень ISIN ЦБ с купонными периодами
   procedure add_isin_secur;   

end;

/

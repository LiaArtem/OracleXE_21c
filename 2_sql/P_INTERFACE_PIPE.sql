--------------------------------------------------------
--  DDL for Package P_INTERFACE_PIPE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "TEST_USER"."P_INTERFACE_PIPE" 
as
    -------------------------------------------------------------------
    type type_fair_value_row is record
    (
     calc_date         date,
     cpcode            varchar2(255),
     ccy               varchar2(3),
     fair_value        number,
     ytm               number,
     clean_rate        number,
     cor_coef          number,
     maturity          date,
     cor_coef_cash     number,
     notional          number,
     avr_rate          number,
     option_value      number,
     intrinsic_value   number,
     time_value        number,
     delta_per         number,
     delta_equ         number,
     dop               varchar2(255)
    );
    type type_fair_value_table is table of type_fair_value_row;    
    -------------------------------------------------------------------
    type type_isin_secur_row is record
    (
      cpcode          varchar2(255),
      nominal         integer,                                      
      auk_proc        number,                                      
      pgs_date        date,                                      
      razm_date       date,                                      
      cptype          varchar2(255),
      cpdescr         varchar2(255),
      pay_period      integer,                                      
      val_code        varchar2(3),                                      
      emit_okpo       varchar2(255),
      emit_name       varchar2(255),
      cptype_nkcpfr   varchar2(255),
      cpcode_cfi      varchar2(255),
      total_bonds     integer,
      pay_date        date,
      pay_type        integer,
      pay_val         number,
      pay_array       varchar2(5)  
    );
    type type_isin_secur_table is table of type_isin_secur_row;    
    -------------------------------------------------------------------
    type type_kurs_nbu_row is record
    (
     r030         varchar2(3),
     txt          varchar2(255),
     rate         number,
     cc           varchar2(3),
     exchangedate date
    );    
    type type_kurs_nbu_table is table of type_kurs_nbu_row;
    -------------------------------------------------------------------
    type type_erb_minfin_row is record
    (
     isSuccess       varchar2(5),
     num_rows        integer,
     requestDate     date,
     isOverflow      varchar2(5),
     num_id          number,
     root_id         number,
     lastname        varchar2(4000),
     firstname       varchar2(4000),
     middlename      varchar2(4000),
     birthdate       varchar2(255),
     publisher       varchar2(4000),
     departmentcode  varchar2(4000),
     departmentname  varchar2(4000),
     departmentphone varchar2(4000),
     executor        varchar2(4000),
     executorphone   varchar2(4000),
     executoremail   varchar2(4000),
     deductiontype   varchar2(4000),
     vpnum           varchar2(4000),
     okpo            varchar2(255),
     full_name       varchar2(4000) 
    );    
    type type_erb_minfin_table is table of type_erb_minfin_row;

    -- Справедливая стоимость ЦБ (котировки НБУ)
    -- Получить данные
    -- select f.* from table (p_interface_pipe.read_fair_value(p_date => to_date('09.04.2021','dd.mm.yyyy'))) f;    
    function read_fair_value (p_date date) -- дата
      return type_fair_value_table pipelined;

    -- Перечень ISIN ЦБ с купонными периодами
    -- Получить данные
    -- select f.* from table (p_interface_pipe.read_isin_secur(p_format => 'json')) f;        
    function read_isin_secur (p_format varchar2) -- формат xml, json
      return type_isin_secur_table pipelined;

    -- Курсы валют НБУ
    -- Получить данные
    -- select f.* from table (p_interface_pipe.read_kurs_nbu(p_date => to_date('09.04.2021','dd.mm.yyyy'), p_format => 'json', p_currency => 'USD')) f;
    function read_kurs_nbu (p_date date, -- дата курсов
                            p_format varchar2, -- формат xml, json
                            p_currency varchar2 default null -- UAH, USD, EUR
                            ) return type_kurs_nbu_table pipelined; 

    -- НАИС - поиск контрагента в ЕРД (едином реестре должников)
    -- Получить данные
    -- select f.* from table (p_interface_pipe.read_erb_minfin(p_identCode => '33270581', p_type_cust_code => '2')) f;    
    -- select f.* from table (p_interface_pipe.read_erb_minfin(p_identCode => '2985108376', p_type_cust_code => '1')) f;
    -- select f.* from table (p_interface_pipe.read_erb_minfin(p_lastName       => 'Бондарчук',
    --                                                         p_firstName      => 'Ігор',
    --                                                         p_middleName     => 'Володимирович',
    --                                                         p_birthDate      => to_date('23.09.1981','dd.mm.yyyy'),
    --                                                         p_type_cust_code => '1')) f;
    function read_erb_minfin (p_categoryCode   varchar2 default null, -- пусто все, 03 - аллименты
                              p_identCode      varchar2 default null,
                              p_lastName       varchar2 default null,
                              p_firstName      varchar2 default null,
                              p_middleName     varchar2 default null,
                              p_birthDate      date     default null,
                              p_type_cust_code varchar2 -- (1 - физ., 2 - юр.)
                              ) return type_erb_minfin_table pipelined;


   -- Справедливая стоимость ЦБ (котировки НБУ)    
   procedure add_fair_value (p_date date);
   
   -- Курсы валют НБУ   
   procedure add_kurs_nbu (p_date date, p_currency_code varchar2);

   -- Перечень ISIN ЦБ с купонными периодами
   procedure add_isin_secur;   
   
end;

/

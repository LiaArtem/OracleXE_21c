# OracleXE_21c
Oracle Database Express Edition 21c integration with WEB-services (GET,POST - JSON,XML,CSV) (pipelined, utl_http, json_object, json_table, json_arrayagg, json_value, xmltable).
Add JSON Data Type (table, json_transform, json_serialize, json_object_t)

IDE - Oracle SQL Developer

1) После установки Oracle Database Express Edition 21c внести изменения в глобальном реестре для поддержки универсальной кодировки:
   Компьютер\HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\KEY_OraDB21Home1 c AMERICAN_AMERICA.WE8MSWIN1252
   на NLS_LANG = AMERICAN_AMERICA.AL32UTF8 (либо AMERICAN_AMERICA.CL8MSWIN1251)

2) Настраиваем кодировку с среде Oracle SQL Developer и запуск debug
   Tools -> Preferences -> Environment -> Encoding (меняем на UTF-8).
   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

   !!! Перед загрузкой таблиц нужно настроить обязательно (экспорт таблиц выполнен в UTF-8).

   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   Либо cp1251 после загрузки объектов если кодировка базы AMERICAN_AMERICA.CL8MSWIN1251.
   На объекте -> Compile for Debug -> Debug

3) Выполняем скрипты ./1_sql_sys/ для создания пользователя и выдачи прав (выполняется под пользовалем SYS).

4) Разворачиваем объекты под пользователем TEST_USER - ./2_sql/ предварительно скопировав в C:\sqldeveloper\export\ и запуском Generated-*.sql под пользователем TEST_USER
   - kill_test_user.sql - скрипт для удаления пользователя если он уже был, чтобы можно было бы заново залить объекты (выполняется под пользовалем SYS).

5) SQL developer -> Recompile Sсhema

6) Настройка Wallet (https соединение)

   Берем готовый ewallet.p12 и размещаем C:\wallet.
   Если сертификат уже не актуальный выполняем ниже.

   Чтобы не было ошибки - ORA-29024: Certificate validation failure настраиваем wallet
   Так как в данном примере читаем web сервисы НБУ и с сайта НАИС берем с сайтов сертификаты для организации https соединения.
   Читаем описание - https://oracle-base.com/articles/misc/utl_http-and-ssl
   - заходим через Google Chrome -> https://bank.gov.ua/ -> Жмем на замок -> Безопасное подключение ->
     -> Действительный сертификат -> Base-64 encoded X.509 (.CER) берем ближайший уровень снизу вверх от *.bank.gov.ua

   Запускаем:
   Oracle Wallet manager -> New -> (Yes, Yes) -> Password (любой, в данном примере = 34534kjhsdffkjsdfgalfgb###) -> (No)
   -> Trusted Certificates -> Import Trusted Certificates -> файл sert_nbu.cer
   -> Закрываем -> Save -> Путь C:\wallet, превдарительно создаем папку wallet или выбираем другой путь.
   -> В папке появится файл ewallet.p12
   !!! обязательно должны быть выданы права на уровне сервера к файлу ewallet.p12 по данному пути (иначе будет ошибка ORA-28759: сбой при открытии файла)

7) Экспорт объектов в SQL developer (пример в изображении - Settings Export object SQL developer.jpg)

-- объекты пользователя
select * from user_objects;

-- инвалидные объекты пользователя
select * from user_objects where status != 'VALID'

-- сессии
select * from V$SESSION;

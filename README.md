# OracleXE_21c
Oracle Database Express Edition 21c integration with WEB-services (GET,POST - JSON,XML,CSV) (pipelined, utl_http, json_object, json_table, json_arrayagg, json_value, xmltable).
Add JSON Data Type (table, json_transform, json_serialize, json_object_t)

IDE - Oracle SQL Developer

1) Після встановлення Oracle Database Express Edition 21c внести зміни до глобального реєстру для підтримки універсального кодування:
   Комп'ютер\HKEY_LOCAL_MACHINE\SOFTWARE\Oracle\KEY_OraDB21Home1 c AMERICAN_AMERICA.WE8MSWIN1252
   на NLS_LANG = AMERICAN_AMERICA.AL32UTF8 (або AMERICAN_AMERICA.CL8MSWIN1251)

2) Налаштовуємо кодування серед Oracle SQL Developer і запуск debug
   Tools -> Preferences -> Environment -> Encoding (змінюємо на UTF-8).

   !!! Перед завантаженням таблиць потрібно налаштувати обов'язково (експорт таблиць виконано у UTF-8).
   ---------------------------------------------------------------------------------
   Або cp1251 після завантаження об'єктів, якщо кодування бази AMERICAN_AMERICA.CL8MSWIN1251.
   На об'єкті -> Compile for Debug -> Debug

3) Виконуємо скрипти ./1_sql_sys/ для створення користувача та видачі прав (виконується під користувачем SYS).

4) Розгортаємо об'єкти під користувачем TEST_USER - ./2_sql/ попередньо скопіювавши в C:\sqldeveloper\export\ і запуском Generated-*.sql під користувачем TEST_USER
   - kill_test_user.sql - скрипт для видалення користувача якщо він вже був, щоб можна було б заново залити об'єкти (виконується під користувачем SYS).

5) SQL developer -> Recompile Sсhema

6) Налаштування Wallet (https з'єднання)

   Беремо готовий ewallet.p12 та розміщуємо C:\wallet.
   Якщо сертифікат вже не є актуальним виконуємо нижче.

   Щоб не було помилки - ORA-29024: Certificate validation failure налаштовуємо wallet
   Так як у цьому прикладі читаємо web сервіси НБУ і з сайту НАІС беремо з сайтів сертифікати для організації https з'єднання.
   Читаємо опис - https://oracle-base.com/articles/misc/utl_http-and-ssl
   - заходимо через Google Chrome -> https://bank.gov.ua/ -> Тиснемо на замок -> Безпечне підключення ->
     -> Справжній сертифікат -> Base-64 encoded X.509 (.CER) беремо найближчий рівень знизу вгору від *.bank.gov.ua

   Запускаємо:
   Oracle Wallet manager -> New -> (Yes, Yes) -> Password (будь-який, в даному прикладі = 34534kjhsdffkjsdfgalfgb###) -> (No)
   -> Trusted Certificates -> Import Trusted Certificates -> файл sert_nbu.cer
   -> Закриваємо -> Save -> Шлях C:\wallet, погано створюємо папку wallet або вибираємо інший шлях.
   -> У папці з'явиться файл ewallet.p12
   !!! обов'язково повинні бути видані права на рівні сервера до файлу ewallet.p12 цим шляхом (інакше буде помилка ORA-28759: збій при відкритті файлу)

7) Експорт об'єктів у SQL developer (приклад у зображенні - Settings Export object SQL developer.jpg)

- об'єкти користувача
select * from user_objects;

- Інвалідні об'єкти користувача
select * from user_objects where status != 'VALID'

- сесії
select * from V$SESSION;

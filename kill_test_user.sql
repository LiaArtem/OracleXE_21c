-- удаление пользователя со всеми его объектами
alter session set "_oracle_script"=true;
drop user test_user cascade;
--------------------------------------------------------
--  DDL for Procedure READ_WALLET_PARAM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "TEST_USER"."READ_WALLET_PARAM" (p_wallet_file out varchar2, p_wallet_file_pwd out varchar2)
is
begin
  p_wallet_file := 'c:\wallet';
  p_wallet_file_pwd := '34534kjhsdffkjsdfgalfgb###';
end;


/

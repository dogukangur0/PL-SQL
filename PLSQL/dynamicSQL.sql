-- PL/SQL i�inde SQL komutlar�n�n kullan�m� (Dynamic SQL - DDL - DCL)

DECLARE
    ddl_command varchar2(2000);
BEGIN
    ddl_command := 'create table TEMP_TABLE (urun_id number(10), urun_adi varchar2(30) )';
    ddl_command := 'alter table TEMP_TABLE ADD urun_fiyat number(10,2)';  -- 10 sat�r son 2 sat�r virg�lden sonra 
    ddl_command := 'grant select on TEMP_TABLE to {NAME}';  -- yetki verme
    ddl_command := 'revoke select on TEMP_TABLE from {NAME}'; -- yetki alma
    ddl_command := 'drop table TEMP_TABLE'; -- tablo silme
    execute immediate ddl_command;
    
END;


desc TEMP_TABLE;
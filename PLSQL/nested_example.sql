-- Nested Tables Data Types

DECLARE
    CURSOR c_emp IS SELECT first_name FROM EMPLOYEES; -- curosr içerisinde tek deðer varken
    TYPE ndt_employee_name_list IS TABLE OF employees.first_name%type; -- tanýmladýðýmýzda henüz hafýzada bir yer ayýrmayacaktýr. constructor ile içeriðini tanýmlamamýz gerekir.
    
    first_name ndt_employee_name_list := ndt_employee_name_list(); -- constructor tanýmlandý.
    counter integer := 0;
BEGIN
-- nested veri tiplerindeki bir deðiþkeni, içeriðine deðer atayabilmek için 'extend' metodu kullanýlýr. diziyi geniþletmek için.
    FOR i IN c_emp LOOP
        counter := counter + 1;
        first_name.extend;
        first_name(counter) := i.first_name;
        dbms_output.put_line('Employee '|| counter || ' First Name: ' || first_name(counter));
    END LOOP;
END;

--------------------------------------

DECLARE
    CURSOR c_emp IS SELECT first_name, last_name FROM EMPLOYEES; -- cursor içerisinde birden fazla deðer varken
    TYPE ndt_employee_name_list IS TABLE OF c_emp%rowtype; -- nested, birden fazla deðeri tutacaðý için cursor'a baðladýk.
    -- tanýmladýðýmýzda henüz hafýzada bir yer ayýrmayacaktýr. constructor ile içeriðini tanýmlamamýz gerekir.

    name_list ndt_employee_name_list := ndt_employee_name_list(); -- constructor tanýmlandý.
    counter integer := 0;
BEGIN
-- nested veri tiplerindeki bir deðiþkeni, içeriðine deðer atayabilmek için 'extend' metodu kullanýlýr. diziyi geniþletmek için.
    FOR i IN c_emp LOOP
        counter := counter + 1;
        name_list.extend;
        name_list(counter).first_name := i.first_name; -- ayný yerden birden fazla veri tutuluyor. referans ile ayrý ayrý çekilir. ayný adresi tutan birden fazla veri. adreste cursor var, cursor içerisinde birden fazla veri var.
        name_list(counter).last_name := i.last_name;
        dbms_output.put_line('Employee '|| counter || ' -- First Name: ' || name_list(counter).first_name || ' -- Last Name: ' || name_list(counter).last_name);
    END LOOP;
END;
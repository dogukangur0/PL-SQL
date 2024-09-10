-- Nested Tables Data Types

DECLARE
    CURSOR c_emp IS SELECT first_name FROM EMPLOYEES; -- curosr i�erisinde tek de�er varken
    TYPE ndt_employee_name_list IS TABLE OF employees.first_name%type; -- tan�mlad���m�zda hen�z haf�zada bir yer ay�rmayacakt�r. constructor ile i�eri�ini tan�mlamam�z gerekir.
    
    first_name ndt_employee_name_list := ndt_employee_name_list(); -- constructor tan�mland�.
    counter integer := 0;
BEGIN
-- nested veri tiplerindeki bir de�i�keni, i�eri�ine de�er atayabilmek i�in 'extend' metodu kullan�l�r. diziyi geni�letmek i�in.
    FOR i IN c_emp LOOP
        counter := counter + 1;
        first_name.extend;
        first_name(counter) := i.first_name;
        dbms_output.put_line('Employee '|| counter || ' First Name: ' || first_name(counter));
    END LOOP;
END;

--------------------------------------

DECLARE
    CURSOR c_emp IS SELECT first_name, last_name FROM EMPLOYEES; -- cursor i�erisinde birden fazla de�er varken
    TYPE ndt_employee_name_list IS TABLE OF c_emp%rowtype; -- nested, birden fazla de�eri tutaca�� i�in cursor'a ba�lad�k.
    -- tan�mlad���m�zda hen�z haf�zada bir yer ay�rmayacakt�r. constructor ile i�eri�ini tan�mlamam�z gerekir.

    name_list ndt_employee_name_list := ndt_employee_name_list(); -- constructor tan�mland�.
    counter integer := 0;
BEGIN
-- nested veri tiplerindeki bir de�i�keni, i�eri�ine de�er atayabilmek i�in 'extend' metodu kullan�l�r. diziyi geni�letmek i�in.
    FOR i IN c_emp LOOP
        counter := counter + 1;
        name_list.extend;
        name_list(counter).first_name := i.first_name; -- ayn� yerden birden fazla veri tutuluyor. referans ile ayr� ayr� �ekilir. ayn� adresi tutan birden fazla veri. adreste cursor var, cursor i�erisinde birden fazla veri var.
        name_list(counter).last_name := i.last_name;
        dbms_output.put_line('Employee '|| counter || ' -- First Name: ' || name_list(counter).first_name || ' -- Last Name: ' || name_list(counter).last_name);
    END LOOP;
END;
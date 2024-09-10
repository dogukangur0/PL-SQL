-- CURSOR - Explicit Cursor - Developer-Defined Cursors

-- SQL%ROWCOUNT -> select edilen kayýt sayýsýný verir.


DECLARE
-- cursor is içinde her iþlem yapýlabilir. (where, order by...)
    CURSOR c_emp IS SELECT employee_id, last_name FROM EMPLOYEES ORDER BY employee_id;
    
    w_employee_id employees.employee_id%type;
    w_last_name employees.last_name%type;

BEGIN 
-- BURADA SELECT ÝFADESÝ KULLANILDIÐINDA SADECE 1 VERÝ OKUR. 1'DEN FAZLA VERÝ OKUMAK ÝÇÝN DECLARE ÝÇERÝSÝNDE CURSOR OLUÞTUR.

-- declare içerisinde oluþturulan cursor burada açýlýp kapanmasý gerek. OPEN - CLOSE 
-- cursor'dan gelen deðerleri okumak için FETCH kullanýlýr. into iþlemi de burada yapýlabilir.
-- birden fazla okuma yaparken loop kullanýlabilir. loop'tan çýkarken exit kullanýlmalý. %NOTFOUND (Implicit Cursor ile koþul kontrol edilebilir.)

    OPEN c_emp;
    LOOP
        FETCH c_emp INTO w_employee_id, w_last_name;
        EXIT WHEN c_emp%NOTFOUND;
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| w_employee_id || ' ' || 'Last Name: ' || w_last_name);
    END LOOP;
    CLOSE c_emp;
END;


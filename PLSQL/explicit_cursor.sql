-- CURSOR - Explicit Cursor - Developer-Defined Cursors

-- SQL%ROWCOUNT -> select edilen kay�t say�s�n� verir.


DECLARE
-- cursor is i�inde her i�lem yap�labilir. (where, order by...)
    CURSOR c_emp IS SELECT employee_id, last_name FROM EMPLOYEES ORDER BY employee_id;
    
    w_employee_id employees.employee_id%type;
    w_last_name employees.last_name%type;

BEGIN 
-- BURADA SELECT �FADES� KULLANILDI�INDA SADECE 1 VER� OKUR. 1'DEN FAZLA VER� OKUMAK ���N DECLARE ��ER�S�NDE CURSOR OLU�TUR.

-- declare i�erisinde olu�turulan cursor burada a��l�p kapanmas� gerek. OPEN - CLOSE 
-- cursor'dan gelen de�erleri okumak i�in FETCH kullan�l�r. into i�lemi de burada yap�labilir.
-- birden fazla okuma yaparken loop kullan�labilir. loop'tan ��karken exit kullan�lmal�. %NOTFOUND (Implicit Cursor ile ko�ul kontrol edilebilir.)

    OPEN c_emp;
    LOOP
        FETCH c_emp INTO w_employee_id, w_last_name;
        EXIT WHEN c_emp%NOTFOUND;
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| w_employee_id || ' ' || 'Last Name: ' || w_last_name);
    END LOOP;
    CLOSE c_emp;
END;


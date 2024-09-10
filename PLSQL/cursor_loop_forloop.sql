-- CURSOR - Explicit Cursor - Developer-Defined Cursors
-- CURSOR DURUM B�LG�LER� %ISOPEN , %NOTFOUND , %FOUND, %ROWCOUNT 
-- Cursors ve Records (Reference Data Type %ROWTYPE)

-- SQL%ROWCOUNT -> select edilen kay�t say�s�n� verir.


DECLARE
-- cursor is i�inde her i�lem yap�labilir. (where, order by...)
    CURSOR c_emp IS SELECT employee_id, last_name FROM EMPLOYEES ORDER BY employee_id;
    -- cursor i�erisinde �ok fazla veri oldu�unda bunlar� tek tek yazmak yerine rowtype kullan�lmas� daha iyi olur.
    r_c_emp c_emp%rowtype;
    
    w_employee_id employees.employee_id%type;
    w_last_name employees.last_name%type;

BEGIN 
-- BURADA SELECT �FADES� KULLANILDI�INDA SADECE 1 VER� OKUR. 1'DEN FAZLA VER� OKUMAK ���N DECLARE ��ER�S�NDE CURSOR OLU�TUR.

-- declare i�erisinde olu�turulan cursor burada a��l�p kapanmas� gerek. OPEN - CLOSE 
-- cursor'dan gelen de�erleri okumak i�in FETCH kullan�l�r. into i�lemi de burada yap�labilir.
-- birden fazla okuma yaparken loop kullan�labilir. loop'tan ��karken exit kullan�lmal�. %NOTFOUND (Implicit Cursor ile ko�ul kontrol edilebilir.)

    IF NOT c_emp%ISOPEN THEN    -- cursor a��k-kapal� durumu kontrol edilir.
        OPEN c_emp;
    END IF;
    
    LOOP
        FETCH c_emp INTO w_employee_id, w_last_name; -- bu k�s�mda c_emp'i okunan r_c_emp olarak g�ncellemek gerek.
        FETCH c_emp INTO r_c_emp;
        EXIT WHEN c_emp%NOTFOUND OR c_emp%rowcount>10;
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| w_employee_id || ' ' || 'Last Name: ' || w_last_name);
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| r_c_emp.employee_id || ' ' || 'Last Name: ' || r_c_emp.last_name); -- bu �ekilde de yazd�rma yap�l�r.
    END LOOP;
    
    IF c_emp%ISOPEN THEN       -- cursor a��k-kapal� durumu kontrol edilir.
        CLOSE c_emp;
    END IF;
END;


--------------------------------------

DECLARE

    CURSOR c_emp IS SELECT * FROM EMPLOYEES ORDER BY employee_id;
    
BEGIN 
    -- FOR LOOP i�erisinde cursor a�-kapa yapmaya gerek yok. otomatik yap�l�r.
    FOR r_c_emp IN c_emp LOOP
            dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| r_c_emp.employee_id || ' ' || 'Last Name: ' || r_c_emp.last_name);
    END LOOP;

END;


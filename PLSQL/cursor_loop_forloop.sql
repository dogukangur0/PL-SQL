-- CURSOR - Explicit Cursor - Developer-Defined Cursors
-- CURSOR DURUM BÝLGÝLERÝ %ISOPEN , %NOTFOUND , %FOUND, %ROWCOUNT 
-- Cursors ve Records (Reference Data Type %ROWTYPE)

-- SQL%ROWCOUNT -> select edilen kayýt sayýsýný verir.


DECLARE
-- cursor is içinde her iþlem yapýlabilir. (where, order by...)
    CURSOR c_emp IS SELECT employee_id, last_name FROM EMPLOYEES ORDER BY employee_id;
    -- cursor içerisinde çok fazla veri olduðunda bunlarý tek tek yazmak yerine rowtype kullanýlmasý daha iyi olur.
    r_c_emp c_emp%rowtype;
    
    w_employee_id employees.employee_id%type;
    w_last_name employees.last_name%type;

BEGIN 
-- BURADA SELECT ÝFADESÝ KULLANILDIÐINDA SADECE 1 VERÝ OKUR. 1'DEN FAZLA VERÝ OKUMAK ÝÇÝN DECLARE ÝÇERÝSÝNDE CURSOR OLUÞTUR.

-- declare içerisinde oluþturulan cursor burada açýlýp kapanmasý gerek. OPEN - CLOSE 
-- cursor'dan gelen deðerleri okumak için FETCH kullanýlýr. into iþlemi de burada yapýlabilir.
-- birden fazla okuma yaparken loop kullanýlabilir. loop'tan çýkarken exit kullanýlmalý. %NOTFOUND (Implicit Cursor ile koþul kontrol edilebilir.)

    IF NOT c_emp%ISOPEN THEN    -- cursor açýk-kapalý durumu kontrol edilir.
        OPEN c_emp;
    END IF;
    
    LOOP
        FETCH c_emp INTO w_employee_id, w_last_name; -- bu kýsýmda c_emp'i okunan r_c_emp olarak güncellemek gerek.
        FETCH c_emp INTO r_c_emp;
        EXIT WHEN c_emp%NOTFOUND OR c_emp%rowcount>10;
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| w_employee_id || ' ' || 'Last Name: ' || w_last_name);
        dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| r_c_emp.employee_id || ' ' || 'Last Name: ' || r_c_emp.last_name); -- bu þekilde de yazdýrma yapýlýr.
    END LOOP;
    
    IF c_emp%ISOPEN THEN       -- cursor açýk-kapalý durumu kontrol edilir.
        CLOSE c_emp;
    END IF;
END;


--------------------------------------

DECLARE

    CURSOR c_emp IS SELECT * FROM EMPLOYEES ORDER BY employee_id;
    
BEGIN 
    -- FOR LOOP içerisinde cursor aç-kapa yapmaya gerek yok. otomatik yapýlýr.
    FOR r_c_emp IN c_emp LOOP
            dbms_output.put_line(c_emp%ROWCOUNT || ' Employee ID: '|| r_c_emp.employee_id || ' ' || 'Last Name: ' || r_c_emp.last_name);
    END LOOP;

END;


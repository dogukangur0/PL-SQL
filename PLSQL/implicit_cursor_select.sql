-- CURSOR - Implicit Cursor - SQL%FOUND , SQL%NOTFOUND , SQL%ROWCOUNT

create table employees2 as select * from employees;

-- SQL%ROWCOUNT -> select edilen kayýt sayýsýný verir.


DECLARE
    rec_emp employees%rowtype;
BEGIN
    SELECT * INTO rec_emp FROM EMPLOYEES2 WHERE employee_id=100;
    
    -- sql%found     ->  true
    -- sql%notfound  ->  false
    
    IF sql%found THEN
        DBMS_OUTPUT.PUT_LINE('Kayit Var ' || sql%rowcount || ' Kayýt Sayýsý Bulundu');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Kayit Yok');
    END IF;
    
    IF sql%notfound THEN
        DBMS_OUTPUT.PUT_LINE('Kayit Var 1');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Kayit Yok 1');
    END IF;
    
    EXCEPTION WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('Kayit Yok 2');
END;
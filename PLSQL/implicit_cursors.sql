-- CURSOR - Implicit Cursor - SQL%FOUND , SQL%NOTFOUND , SQL%ROWCOUNT

-- SQL%ROWCOUNT -> select edilen kay�t say�s�n� verir.


DECLARE
   
BEGIN
    UPDATE EMPLOYEES2 SET salary = salary*1.20 WHERE department_id = 500;
    
    IF sql%found THEN
        dbms_output.put_line(sql%rowcount || ' ki�i update edildi.');
    ELSE 
        dbms_output.put_line('Update edilecek kay�t bulunamad�.');
    END IF;
    
    DELETE FROM EMPLOYEE2 WHERE DEPARTMENT_ID IN (80,100)
    -- birden fazla de�er silmek istedi�imizde IN komutu kullan�labilir.
END;
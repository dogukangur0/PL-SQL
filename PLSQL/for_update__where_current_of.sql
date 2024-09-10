-- CURSOR -- FOR UPDATE ve WHERE CURRENT OF kullanýmý
-- Maaþý 5000'den az olanlara %20 zam yap.

DECLARE
    CURSOR c_emp IS SELECT * FROM EMPLOYEES2 FOR UPDATE OF salary; -- FOR UPDATE OF -> lock iþlemidir. salary diyerek sadece o sütun lock edilir. sadece FOR UPDATE yazýlýrsa tüm sütünlar lock edilir.
    -- Burada deðiþiklik yapýlýrken baþka taraftan iþlem yapýlmasýna izin vermez. Ýþlem bitene kadar kilitli kalýr.
BEGIN 
    FOR r_emp IN c_emp LOOP
        IF r_emp.salary < 5000 THEN
            UPDATE EMPLOYEES2 SET salary = salary * 1.2 WHERE employee_id = r_emp.employee_id; -- WHERE CURRENT OF c_emp 
            dbms_output.put_line(r_emp.employee_id || ' ' || r_emp.first_name || ' ' || r_emp.salary);
        END IF;
    END LOOP;
    
    COMMIT;  -- EN SONRA COMMIT YA DA ROLLBACK YAPILMALI YOKSA KÝLÝTLÝ KALIR.
END;
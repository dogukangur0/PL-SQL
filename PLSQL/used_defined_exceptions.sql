-- USER DEFINED EXCEPTIONS

DECLARE
    v_dept_id employees.department_id%type;
    v_toplam number;
    e_invalid_id EXCEPTION;
    
BEGIN
    v_dept_id := &v_dept_id;
    IF v_dept_id >0 THEN
        SELECT COUNT(*) INTO v_toplam FROM EMPLOYEES WHERE DEPARTMENT_ID = v_dept_id;
        dbms_output.put_line('Toplam: '||v_toplam);
    ELSE
       RAISE e_invalid_id;   -- yönlendirme yapmak için RAISE anahtar kelimesi kullanýlýr.
    END IF;
    
     EXCEPTION WHEN e_invalid_id THEN
        dbms_output.put_line('Bölüm no negatif olamaz.');
END;
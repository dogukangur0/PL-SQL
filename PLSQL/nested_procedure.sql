-- Nested Procedures
-- Unnamed Block içerisinde, çalýþan ismini yazdýran bir procedure yazmak.


DECLARE
-- procedure, declare içerisinde tanýmlanýr. 
-- parametre alabilir. 
-- begin-end yapýsýna sahiptir.
    PROCEDURE p_names IS 
        p_last_names employees.last_name%type;
        -- procedure içerisinde tanýmlanan objeler sadece bu alanda çaðrýlabilir.
    BEGIN
        -- SELECT last_name INTO ... FROM EMPLOYEES WHERE DEPARTMENT_ID=101;
        -- gelen verileri bir deðiþkene aktarmak gerek.
        SELECT last_name INTO p_last_names FROM EMPLOYEES WHERE EMPLOYEE_ID=101;
        dbms_output.put_line('Employee Name: '|| p_last_names);
    END p_names; -- karýþýklýk olmamasý için isteðe baðlý procedure name yazýlabilir.
    
    PROCEDURE updated_name IS 
        new_name employees.last_name%type;
    BEGIN
        UPDATE employees SET last_name = UPPER(last_name) WHERE employee_id = 101 RETURNING last_name INTO new_name;
        dbms_output.put_line('New Employee Name: '|| new_name);
    END updated_name;
    
BEGIN
    p_names;
    updated_name;
END;
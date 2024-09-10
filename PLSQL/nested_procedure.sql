-- Nested Procedures
-- Unnamed Block i�erisinde, �al��an ismini yazd�ran bir procedure yazmak.


DECLARE
-- procedure, declare i�erisinde tan�mlan�r. 
-- parametre alabilir. 
-- begin-end yap�s�na sahiptir.
    PROCEDURE p_names IS 
        p_last_names employees.last_name%type;
        -- procedure i�erisinde tan�mlanan objeler sadece bu alanda �a�r�labilir.
    BEGIN
        -- SELECT last_name INTO ... FROM EMPLOYEES WHERE DEPARTMENT_ID=101;
        -- gelen verileri bir de�i�kene aktarmak gerek.
        SELECT last_name INTO p_last_names FROM EMPLOYEES WHERE EMPLOYEE_ID=101;
        dbms_output.put_line('Employee Name: '|| p_last_names);
    END p_names; -- kar���kl�k olmamas� i�in iste�e ba�l� procedure name yaz�labilir.
    
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
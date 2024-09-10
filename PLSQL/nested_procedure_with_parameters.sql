-- Nested Procedures
-- procedure olu�turulurken parametre alabilir. 
-- (parameter_obj IN || OUT || INOUT data_type)
-- IN      -> d��ardan de�er alan 
-- ON      -> d��ar�ya de�er d�nd�ren
-- INOUT   -> d��ardan hem de�er alan hem de�er d�nd�ren
-- *** parametre tan�mlan�rken tipi belirlenmezse default olarak IN olur.

-- Parametreli Procedures

DECLARE
-- procedure, declare i�erisinde tan�mlan�r. 
-- parametre alabilir. 
-- begin-end yap�s�na sahiptir.
    PROCEDURE p_names(param_emp_id IN employees.employee_id%type) IS 
        p_last_names employees.last_name%type;
    BEGIN
        SELECT last_name INTO p_last_names FROM EMPLOYEES WHERE EMPLOYEE_ID=101;
        dbms_output.put_line('Employee Name: '|| p_last_names);
    END p_names;
    
    PROCEDURE updated_name(param_emp_id IN employees.employee_id%type) IS 
        new_name employees.last_name%type;
    BEGIN
        UPDATE employees SET last_name = UPPER(last_name) WHERE employee_id = 101 RETURNING last_name INTO new_name;
        dbms_output.put_line('New Employee Name: '|| new_name);
    END updated_name;
    
BEGIN
    p_names(101);
    updated_name(101);
END;
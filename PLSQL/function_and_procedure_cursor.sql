-- Function and Procedure 
-- Function ile department id deðerine göre department adýný döndür.
-- Procedure ile de bu department içerisinde bulunan kullaný bilgilerini döndür.

DECLARE
    FUNCTION dep_name(param_dep_id departments.department_id%type) RETURN departments.department_name%type IS
        f_dep_name departments.department_name%type;
    BEGIN
        SELECT department_name INTO f_dep_name FROM DEPARTMENTS WHERE department_id = param_dep_id;
        RETURN(f_dep_name);
        EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN(null);
    END dep_name;
    
    PROCEDURE prd_emp(param_dep_id departments.department_id%type) IS 
    BEGIN 
        dbms_output.put_line(param_dep_id|| ' - '|| dep_name(param_dep_id));
        dbms_output.new_line;
        DECLARE
            CURSOR c_emp IS SELECT employee_id, first_name, last_name FROM EMPLOYEES WHERE department_id = param_dep_id;
            r_emp c_emp%rowtype;
        BEGIN
            OPEN c_emp;
            LOOP
                FETCH c_emp INTO r_emp;
                EXIT WHEN c_emp%NOTFOUND;
                dbms_output.put_line('Employee ID:'||r_emp.employee_id||' Full Name: '||r_emp.first_name||' '||r_emp.last_name);
            END LOOP;
            CLOSE c_emp;
        END;
    END;
BEGIN
    prd_emp(60);
END;
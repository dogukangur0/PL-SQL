DECLARE

    CURSOR c_emp IS SELECT employee_id FROM employees;
    c_read_emp c_emp%rowtype;

    PROCEDURE prc_full_names(param_emp_id IN employees.employee_id%type) IS 
        p_first_name employees.first_name%type;
        p_last_name  employees.last_name%type;
    BEGIN
        SELECT first_name,last_name INTO p_first_name, p_last_name FROM EMPLOYEES WHERE employee_id = param_emp_id;
        dbms_output.put_line('Employee Name: '|| p_first_name||' '||p_last_name);
    END prc_full_names;
    
BEGIN
    OPEN c_emp;
        LOOP
            FETCH c_emp INTO c_read_emp;
            EXIT WHEN c_emp%NOTFOUND;
                prc_full_names(c_read_emp.employee_id);
        END LOOP;
    CLOSE c_emp;
END;

------------------


-- Nested Procedures -- Parametreli (IN, OUT, INOUT)

DECLARE
    CURSOR c_emp IS SELECT employee_id,salary FROM employees;
    c_read_emp c_emp%rowtype;
    raise_rate number := 20;
    PROCEDURE prc_raise_salary (param_emp_id IN employees.employee_id%type, param_salary IN OUT employees.salary%type) IS
        p_first_name   employees.first_name%type;
        p_last_name    employees.last_name%type;
    BEGIN
        SELECT first_name, last_name INTO p_first_name, p_last_name FROM employees WHERE employee_id = param_emp_id;
        param_salary := param_salary + (param_salary * raise_rate / 100);
        dbms_output.put_line('Employee Name: '|| p_first_name || ' '|| p_last_name || ' New Salary: '|| param_salary);
    END prc_raise_salary;
    
BEGIN
    OPEN c_emp;
        LOOP
            FETCH c_emp INTO c_read_emp;
            EXIT WHEN c_emp%NOTFOUND;
                prc_raise_salary(c_read_emp.employee_id,c_read_emp.salary);
        END LOOP; 
    CLOSE c_emp;
END;
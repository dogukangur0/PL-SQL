/*
DECLARE

BEGIN
    FOR dep IN (SELECT department_id, department_name FROM DEPARTMENTS ORDER BY department_id) LOOP
        dbms_output.put_line('Department ID: ' || dep.department_id || ' Department Name: '||dep.department_name);
        FOR dep_emp IN (SELECT employee_id, first_name, department_id FROM EMPLOYEES ORDER BY employee_id) LOOP
            IF dep_emp.department_id = dep.department_id THEN
                dbms_output.put_line('               Department ID: ' || dep_emp.department_id || ' Employee ID: ' || dep_emp.employee_id || ' Employee Name: '||dep_emp.first_name);
            END IF;
        END LOOP;
    END LOOP;
END;
*/

DECLARE
 manager_name employees.last_name%type;
BEGIN
    FOR dep IN (SELECT department_id, department_name,manager_id FROM DEPARTMENTS ORDER BY department_id) LOOP
        BEGIN
            SELECT last_name INTO manager_name FROM EMPLOYEES WHERE employee_id = dep.manager_id;
            EXCEPTION WHEN no_data_found THEN
                manager_name := null;
        END;
        dbms_output.put_line('Department ID: ' || dep.department_id || ' Department Name: '||dep.department_name || ' Manager Name: '||manager_name);
        FOR dep_emp IN (SELECT employee_id, first_name FROM EMPLOYEES WHERE department_id = dep.department_id) LOOP
            dbms_output.put_line('Employee ID: ' || dep_emp.employee_id || ' Employee Name: '||dep_emp.first_name);
        END LOOP;
    END LOOP;
END;
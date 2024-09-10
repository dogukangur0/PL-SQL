-- PL/SQL içinde SQL komutlarýnýn kullanýmý (Static SQL - DML - TCL)

DECLARE
    emp_id          employees2.employee_id%type;
    emp_first_name  employees2.first_name%type := 'Dogukan';
    emp_last_name   employees2.last_name%type  := 'Gur'; 
    emp_job_id      employees2.job_id%type     := 'pl/sql';
BEGIN
    SELECT nvl(MAX(employee_id),0)+1 INTO emp_id FROM employees2;
    -- nvl -> HÝÇ KAYIT YOKSA 0 DEÐERÝ DÖNDÜRSÜN

    INSERT INTO employees2(employee_id,
                           first_name,
                           last_name,email,hire_date,
                           job_id)
                  VALUES ( emp_id,
                           emp_first_name,
                           emp_last_name,'email.com',sysdate,
                           emp_job_id);
                           
    UPDATE employees2 SET job_id = 'DBA' WHERE employee_id = emp_id;
    
    /*DELETE employees2 WHERE employee_id = emp_id
    RETURNING employee_id, first_name, job_id INTO emp_id, emp_first_name, emp_job_id;
    */
    rollback;   -- -> yapýlan tüm iþlemleri iptal et
    commit;
    
    DBMS_OUTPUT.PUT_LINE(emp_id || ' ' || emp_first_name || ' ' || emp_job_id);
    
END;





/*
    test_hr_1 içerisinde;
    
    create table employees2 as select * from employees;
    
    select * from employees2 where employee_id=207;

*/
-- STANDOLE STORED PROCEDURES

/*
    SYNTAX
    CREATE [OR REPLACE] PROCEDURE <procedure_name> ( <parameters> IS <variables>
        BEGIN
        END <procedure_name>;
        
    DROP PROCEDURE <procedure_name>;
    
    how to work?
    EXECUTE <procedure_name(parameters)>;
    
*/



    CREATE OR REPLACE PROCEDURE prd_days 
                                (
                                    dept_id          IN  number,
                                    dept_name        IN  varchar2,
                                    dept_manager_id  IN  DEPARTMENTS.manager_id%type,
                                    dept_location_id IN  DEPARTMENTS.location_id%type,
                                    prd_result       OUT VARCHAR2
                                ) IS 
    BEGIN
        IF TO_CHAR(sysdate, 'DY') IN ('SUN','MON') THEN
            prd_result := 'Cumartesi ve Pazar günleri kayýt eklenemez.';
        ELSE
            BEGIN
                INSERT INTO DEPARTMENTS(department_id, department_name, manager_id, location_id)
                VALUES (dept_id, dept_name, dept_manager_id, dept_location_id);
                prd_result := 'Kayýt eklendi!';
                EXCEPTION WHEN OTHERS THEN
                prd_result := sqlcode ||' '||sqlerrm;
            END;
        END IF;
    END prd_days;
    
    
    -- OUT parametreli procedureler exec ile çalýþtýrýlamaz. BEGIN_END bloðu içerisinde yapýlmalý.
    
        
        DESC DEPARTMENTS;
    DECLARE
        wresult varchar2(300);
    BEGIN
        prd_days(380, 'Eðitim', '145', 1700, wresult);
        dbms_output.put_line(wresult);
    END;
    
    select department_id from departments;
    
    
    
    
    
-- predefined exceptions

DECLARE
    rec_emp employees%rowtype;
    val1 number(5);
BEGIN
    SELECT * INTO rec_emp FROM EMPLOYEES WHERE employee_id = 1; -- NO_DATA_FOUND
    SELECT * INTO rec_emp FROM EMPLOYEES;                       -- TOO_MANY_ROWS 
    val1 := 123456;                                             -- VALUE_ERROR
    val1 := 5000/0;                                             -- ZERO_DIVIDE 
    
    
    dbms_output.put_line(rec_emp.employee_id || ' ' || rec_emp.first_name);
    
    EXCEPTION WHEN NO_DATA_FOUND THEN
              -- KOD
              WHEN TOO_MANY_ROWS THEN
              -- KOD
              WHEN VALUE_ERROR THEN
              -- KOD
              WHEN ZERO_DIVIDE THEN
              -- KOD
END;

----

-- Internally Defined Exceptions (Dahili Tanýmlý Ýstisnalar)  -- OTHERS , Exception SCOPE
-- error kodu olan ancak ismi olmayan 

-- pragma exception init / exception when others

DECLARE
    my_exception EXCEPTION;
    PRAGMA exception_init(my_exception, -2292);
BEGIN
    INSERT INTO REGIONS VALUES (1,'Antartika');
    EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Others Hata: '||sqlcode ||' '|| sqlerrm);
    BEGIN
        DELETE FROM departments WHERE DEPARTMENT_ID = 90;
        EXCEPTION WHEN my_exception THEN
            DBMS_OUTPUT.PUT_LINE('Hata');
    END;
END;
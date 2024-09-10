-- Record Data Types - Developer-Defined Records + Nested Records

DECLARE
    TYPE record_isim IS RECORD(
                        first_name employees.first_name%type,
                        last_name employees.last_name%type
                        );
                        
    TYPE contact IS RECORD(
                          full_name record_isim,  -- nested record
                          telephone employees.phone_number%type
                           );        
    TYPE ntd_rehber IS TABLE OF contact; -- Nested Table Data Types with RECORD
    ntd_rehber_object ntd_rehber := ntd_rehber();
    j number := 0;
BEGIN 
    FOR i IN (SELECT first_name, last_name, phone_number FROM EMPLOYEES WHERE department_id=60) LOOP
        j := j+1;
        ntd_rehber_object.EXTEND;
        ntd_rehber_object(j).full_name.first_name   := i.first_name;
        ntd_rehber_object(j).full_name.last_name    := i.last_name;
        ntd_rehber_object(j).telephone              := i.phone_number;
    END LOOP;
    
    j := ntd_rehber_object.FIRST;
    WHILE j IS NOT NULL LOOP
        dbms_output.put_line('Employee name: '|| ntd_rehber_object(j).full_name.first_name);
        dbms_output.put_line('Employee surname: '|| ntd_rehber_object(j).full_name.last_name);
        dbms_output.put_line('Employee phone number: '|| ntd_rehber_object(j).telephone);
        dbms_output.put_line('--------');
        j := ntd_rehber_object.NEXT(j);
    END LOOP;
END;
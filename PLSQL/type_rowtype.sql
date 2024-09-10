-- %TYPE %ROWTYPE 
-- Senaryo : DEPARTMENTS tablosundan, DEPARTMENT_ID'si 10 olan kaydý ekranda listeleyelim.


DECLARE
/*
    WDEPARTMENT_ID     NUMBER(4);  
    WDEPARTMENT_NAME   VARCHAR2(30); 
    WMANAGER_ID        NUMBER(6);
    WLOCATION_ID       NUMBER(4);
    
    verileri burada static olarak tanýmladýk. Eðer veritabanýnda bir deðiþiklik olursa
    bunlarý tekrardan düzenlemek yerine %TYPE kullanabiliriz.
*/
    WDEPARTMENT_ID     DEPARTMENTS.DEPARTMENT_ID%TYPE;  
    WDEPARTMENT_NAME   DEPARTMENTS.DEPARTMENT_NAME%TYPE; 
    WMANAGER_ID        DEPARTMENTS.MANAGER_ID%TYPE;
    WLOCATION_ID       DEPARTMENTS.LOCATION_ID%TYPE;
    
    
BEGIN
    SELECT * INTO WDEPARTMENT_ID, WDEPARTMENT_NAME, WMANAGER_ID, WLOCATION_ID 
    FROM DEPARTMENTS
    WHERE DEPARTMENT_ID=10;
    
    DBMS_OUTPUT.PUT_LINE(WDEPARTMENT_ID ||' '|| WDEPARTMENT_NAME ||' '|| WMANAGER_ID ||' '|| WLOCATION_ID);

END;


DECLARE
    r_type_departments DEPARTMENTS%ROWTYPE;    
BEGIN
    SELECT * INTO r_type_departments FROM DEPARTMENTS WHERE DEPARTMENT_ID=10;
    
    DBMS_OUTPUT.PUT_LINE(r_type_departments.DEPARTMENT_ID ||' '|| r_type_departments.DEPARTMENT_NAME ||' '|| r_type_departments.MANAGER_ID ||' '|| r_type_departments.LOCATION_ID);

END;
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
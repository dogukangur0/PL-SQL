-- COLLECTIONS METHODS (FIRST - LAST - COUNT -LIMIT)

DECLARE
    TYPE v_array IS VARRAY(10) OF NUMBER;  -- limit sýnýrlýdýr.
    TYPE ntd_array IS TABLE OF NUMBER;     -- limitler sýnýrsýzdýr o yüzden çýktý boþ gösterir.
    TYPE assc_array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    
    v_array_obj v_array := v_array(1,2,3,4,5,6);
    ntd_array_obj ntd_array := ntd_array(1,2,3,4,5,6);
    assc_array_obj assc_array;  -- parametre almaz.
    
    PROCEDURE yaz IS
    BEGIN
        /*dbms_output.put_line('FIRST: '|| v_array_obj.FIRST);
        dbms_output.put_line('LAST: '|| v_array_obj.LAST);
        dbms_output.put_line('COUNT: '|| v_array_obj.COUNT);
        dbms_output.put_line('LIMIT: '|| v_array_obj.LIMIT);*/
        
        dbms_output.put_line('FIRST: '|| ntd_array_obj.FIRST);
        dbms_output.put_line('LAST: '|| ntd_array_obj.LAST);
        dbms_output.put_line('COUNT: '|| ntd_array_obj.COUNT);
        dbms_output.put_line('LIMIT: '|| ntd_array_obj.LIMIT);
    END;
BEGIN
    dbms_output.put_line('Orjinal Deðerler');
    yaz;
    
    v_array_obj.EXTEND(2,4);
    ntd_array_obj.EXTEND(2,4);
    --dbms_output.put_line('v_array_obj.extend(2,4) Deðerler');
    dbms_output.put_line('ntd_array_obj.extend(2,4) Deðerler');
    yaz;
    
    v_array_obj.TRIM(2);
    ntd_array_obj.TRIM(2);
   -- dbms_output.put_line('v_array_obj.trim(2) Deðerler');
   dbms_output.put_line('ntd_array_obj.trim(2) Deðerler');
    yaz;
    dbms_output.put_line('------------------------------');
    assc_array_obj(1) := 1;
    assc_array_obj(2) := 2;
    assc_array_obj(3) := 3;
    assc_array_obj(4) := 4;
    assc_array_obj(5) := 5;
    -- assc'de extend ve trim ifadeleri çalýþmaz.
    
    dbms_output.put_line('FIRST: '|| assc_array_obj.FIRST);
    dbms_output.put_line('LAST: '|| assc_array_obj.LAST);
    dbms_output.put_line('COUNT: '|| assc_array_obj.COUNT);
    dbms_output.put_line('LIMIT: '|| assc_array_obj.LIMIT);
    
    assc_array_obj.DELETE(1); -- ilk elemaný siler. parametre vermezsek hepsini siler.
    
    
    
END;
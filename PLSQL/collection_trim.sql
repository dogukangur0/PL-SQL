-- COLLECTION METHODS (TRIM)

DECLARE
    TYPE varr_type IS VARRAY(10) OF INTEGER;
    var1 varr_type := varr_type(10,20,30,40,50);
BEGIN
    dbms_output.new_line;
    dbms_output.put_line('Orjinal Deðerler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    var1.trim;
    dbms_output.new_line;
    dbms_output.put_line('Trim Sonrasý Deðerler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    var1.trim(2);
    dbms_output.new_line;
    dbms_output.put_line('Trim Sonrasý Deðerler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    -- TRIM ilgili hücreyi tamamen dizinin dýþýna atar.
    -- DELETE ilgili hücreyi tamamen kaldýrmaz sadece tanýmsýz yapar.
    dbms_output.new_line;
    dbms_output.put_line('Delete Sonrasý Deðerler');
    var1.delete;  -- varray'de delete iþlemini parametreli kullanamayýz.
    FOR i IN 1..5 LOOP
        IF var1.exists(i) THEN
            dbms_output.put_line('Dizi('||i||') : '||var1(i));
        ELSE
            dbms_output.put_line('Dizi('||i||') : Tanýmsýz');
        END IF;
    END LOOP;
    
END;
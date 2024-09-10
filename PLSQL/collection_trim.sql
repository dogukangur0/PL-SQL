-- COLLECTION METHODS (TRIM)

DECLARE
    TYPE varr_type IS VARRAY(10) OF INTEGER;
    var1 varr_type := varr_type(10,20,30,40,50);
BEGIN
    dbms_output.new_line;
    dbms_output.put_line('Orjinal De�erler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    var1.trim;
    dbms_output.new_line;
    dbms_output.put_line('Trim Sonras� De�erler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    var1.trim(2);
    dbms_output.new_line;
    dbms_output.put_line('Trim Sonras� De�erler');
    FOR i IN 1..var1.count LOOP
        dbms_output.put_line('Dizi('||i||') : '||var1(i));
    END LOOP;
    
    -- TRIM ilgili h�creyi tamamen dizinin d���na atar.
    -- DELETE ilgili h�creyi tamamen kald�rmaz sadece tan�ms�z yapar.
    dbms_output.new_line;
    dbms_output.put_line('Delete Sonras� De�erler');
    var1.delete;  -- varray'de delete i�lemini parametreli kullanamay�z.
    FOR i IN 1..5 LOOP
        IF var1.exists(i) THEN
            dbms_output.put_line('Dizi('||i||') : '||var1(i));
        ELSE
            dbms_output.put_line('Dizi('||i||') : Tan�ms�z');
        END IF;
    END LOOP;
    
END;
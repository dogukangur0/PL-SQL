-- COLLECTION METHODS (DELETE)

DECLARE

    TYPE ndt_sayilar IS TABLE OF INTEGER;
    ndt_dizi ndt_sayilar := ndt_sayilar(10,20,30,40,50);
    number_of_array integer:= ndt_dizi.count;
BEGIN
    dbms_output.put_line('Orjinal');
    FOR i IN 1..number_of_array LOOP
        dbms_output.put_line('Dizi('||i||') : '|| ndt_dizi(i));
    END LOOP;
    
    dbms_output.new_line;
    dbms_output.put_line('Delete Ýþlemi');
    ndt_dizi.DELETE(2);
    FOR i IN 1..number_of_array LOOP
        IF ndt_dizi.exists(i) THEN
            dbms_output.put_line('Dizi('||i||') : '|| ndt_dizi(i));
        ELSE
            dbms_output.put_line('Dizi('||i||') : YOK');
        END IF;
    END LOOP;
    
    dbms_output.new_line;
    dbms_output.put_line('Ekleme Ýþlemi');
    ndt_dizi(2):=20;
     FOR i IN 1..number_of_array LOOP
        IF ndt_dizi.exists(i) THEN
            dbms_output.put_line('Dizi('||i||') : '|| ndt_dizi(i));
        ELSE
            dbms_output.put_line('Dizi('||i||') : YOK');
        END IF;
    END LOOP;
    
    ndt_dizi.DELETE(2,4); -- 2 ve 4 aralýðýndaki tüm elemanlarý siler.
    ndt_dizi.DELETE ;     -- tüm elemanlarý siler.
END;


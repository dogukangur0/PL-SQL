-- COLLECTION METHODS EXISTS

DECLARE
    TYPE ndt_type IS TABLE OF CHAR(1);
    ndt_var ndt_type := ndt_type('P','L','/','S','Q','L'); 
BEGIN
    FOR i IN 1..6 LOOP
        IF ndt_var.EXISTS(i) THEN
            dbms_output.put_line(i || '. Deðer: '|| ndt_var(i));
        ELSE 
            dbms_output.put_line(i || '. Deðer: YOK');
        END IF;
    END LOOP;
    
    dbms_output.new_line;
    ndt_var.delete(3); -- elemaný yok etmiyor sadece tanýmsýz hale getiriyor.
    
     FOR i IN 1..6 LOOP
        IF ndt_var.EXISTS(i) THEN
            dbms_output.put_line(i || '. Deðer: '|| ndt_var(i));
        ELSE 
            dbms_output.put_line(i || '. Deðer: YOK');
        END IF;
    END LOOP;
    
END;
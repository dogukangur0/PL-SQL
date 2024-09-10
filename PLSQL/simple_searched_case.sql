-- SIMPLE CASE

DECLARE
    mynumber number := &mynumber; -- kullan�c� de�er girer.
    myresult varchar2(100);
BEGIN
    CASE mod(mynumber,2)
        WHEN 1 THEN myresult := 'Tek Sayi '||mynumber;
        WHEN 0 THEN myresult := '�ift Sayi '||mynumber;
    END CASE;
    
    dbms_output.put_line(myresult);
END;


-- SEARCHED CASE

DECLARE
    mynumber number := &mynumber; -- kullan�c� de�er girer.
    myresult varchar2(100);
BEGIN
    CASE 
        WHEN mod(mynumber,2)=1 THEN myresult := 'Tek Sayi '||mynumber;
        WHEN mod(mynumber,2)=0 THEN myresult := '�ift Sayi '||mynumber;
    END CASE;
    
    dbms_output.put_line(myresult);
END;

-- nested �ekilde de kullan�labilir.
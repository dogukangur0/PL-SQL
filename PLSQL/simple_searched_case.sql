-- SIMPLE CASE

DECLARE
    mynumber number := &mynumber; -- kullanýcý deðer girer.
    myresult varchar2(100);
BEGIN
    CASE mod(mynumber,2)
        WHEN 1 THEN myresult := 'Tek Sayi '||mynumber;
        WHEN 0 THEN myresult := 'Çift Sayi '||mynumber;
    END CASE;
    
    dbms_output.put_line(myresult);
END;


-- SEARCHED CASE

DECLARE
    mynumber number := &mynumber; -- kullanýcý deðer girer.
    myresult varchar2(100);
BEGIN
    CASE 
        WHEN mod(mynumber,2)=1 THEN myresult := 'Tek Sayi '||mynumber;
        WHEN mod(mynumber,2)=0 THEN myresult := 'Çift Sayi '||mynumber;
    END CASE;
    
    dbms_output.put_line(myresult);
END;

-- nested þekilde de kullanýlabilir.
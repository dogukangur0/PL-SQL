-- CASE

DECLARE
    birthDate date := to_date('10/02/1993','dd/mm/yyyy');
    age number(2);
    result varchar2(1000);
BEGIN
    age := (sysdate - birthDate)/365;
    
    CASE
        WHEN age<18 THEN result:='Ben bir çocuðum ve yaþým '||age;
        WHEN age<25 THEN result:='Ben bir gencim ve yaþým '||age;
        WHEN age<30 THEN result:='Ben çocuk deðilim ve yaþým '||age;
        ELSE dbms_output.put_line('Hata');
    END CASE;
    dbms_output.put_line(result);
END;
-- IF

DECLARE
    birthDate date := to_date('10/02/2003','dd/mm/yyyy');
    age number(2);
BEGIN
    age := (sysdate - birthDate)/365;
    
    if age < 18 then
        dbms_output.put_line('Ben bir �ocu�um ve ya��m '||age);
    elsif age < 25 then
        dbms_output.put_line('Ben bir gencim ve ya��m '||age);
    else
       dbms_output.put_line('Ben �ocuk de�ilim ve ya��m '||age);
    end if;
END;
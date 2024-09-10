-- Record Data Types - Table-Based-Records
-- En y�ksek maa� alan�n bilgilerini yaz.

DECLARE
    employee employees%rowtype;
BEGIN
    SELECT * INTO employee FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

    dbms_output.put_line('En y�ksek maas alanin ismi: '|| employee.first_name);
    dbms_output.put_line('En y�ksek maas alanin soy ismi: '|| employee.last_name);
    dbms_output.put_line('En y�ksek maa�: '|| employee.salary);
END;

-- Cursor Data Types - Cursor-Based-Records
-- Ortalama maa�tan d���k maa� alan�n bilgilerini yaz.



DECLARE 
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, salary FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
    calisanlar c_oku%ROWTYPE;
BEGIN 
    OPEN c_oku;
    LOOP
        FETCH c_oku INTO calisanlar;
        EXIT WHEN c_oku%NOTFOUND;
        dbms_output.put_line('�al��an ki�inin id: '|| calisanlar.employee_id || ' ad�: '|| calisanlar.first_name || ' soyad�: ' || calisanlar.last_name || ' maa��: ' || calisanlar.salary);
    END LOOP;
    CLOSE c_oku;
END;
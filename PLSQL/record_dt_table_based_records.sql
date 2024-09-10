-- Record Data Types - Table-Based-Records
-- En yüksek maaþ alanýn bilgilerini yaz.

DECLARE
    employee employees%rowtype;
BEGIN
    SELECT * INTO employee FROM EMPLOYEES WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

    dbms_output.put_line('En yüksek maas alanin ismi: '|| employee.first_name);
    dbms_output.put_line('En yüksek maas alanin soy ismi: '|| employee.last_name);
    dbms_output.put_line('En yüksek maaþ: '|| employee.salary);
END;

-- Cursor Data Types - Cursor-Based-Records
-- Ortalama maaþtan düþük maaþ alanýn bilgilerini yaz.



DECLARE 
    CURSOR c_oku IS SELECT employee_id, first_name, last_name, salary FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
    calisanlar c_oku%ROWTYPE;
BEGIN 
    OPEN c_oku;
    LOOP
        FETCH c_oku INTO calisanlar;
        EXIT WHEN c_oku%NOTFOUND;
        dbms_output.put_line('Çalýþan kiþinin id: '|| calisanlar.employee_id || ' adý: '|| calisanlar.first_name || ' soyadý: ' || calisanlar.last_name || ' maaþý: ' || calisanlar.salary);
    END LOOP;
    CLOSE c_oku;
END;
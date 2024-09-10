-- Collection Data Types 
-- Associative Index By Tables

-- TYPE <veriTipi_ismi> IS TABLE OF <deger_veri_tipi> INDEX BY <index_veri_tipi>; 
DECLARE
    TYPE w_assoc_num IS TABLE OF PLS_INTEGER INDEX BY PLS_INTEGER;                    -- number - number
    w_kare w_assoc_num; -- oluþturulan w_assoc_num için bir w_kare_of_number adýnda bir nesne oluþturuldu.
    j number;
    
    TYPE w_assoc_str IS TABLE OF employees.last_name%type INDEX BY PLS_INTEGER;       -- number - varchar
    w_last_name w_assoc_str;
    
    TYPE w_assoc_str_str IS TABLE OF jobs.job_title%type INDEX BY jobs.job_id%type;        -- varchar - varchar
    w_job w_assoc_str_str;
    
BEGIN
    
    FOR i IN 1..10 LOOP
        w_kare(i) := POWER(i,2);
    END LOOP;
    j := w_kare.first;
    
    WHILE j IS NOT NULL LOOP
        dbms_output.put_line(j||' sayýsýnýn karesi: ' || w_kare(j));
        j := w_kare.next(j);
    END LOOP;
    
    j := 0;
    FOR i IN (SELECT last_name FROM EMPLOYEES WHERE ROWNUM <= 10) LOOP
        j := j+1;
        w_last_name(j) :=i.last_name;
        dbms_output.put_line('w_last_name('||j||')'|| ' ' || w_last_name(j));
    END LOOP;
    
    FOR i IN (SELECT job_id, job_title FROM jobs) LOOP
        w_job(i.job_id) := i.job_title;
        dbms_output.put_line('Job ID: '|| i.job_id || ' Job Title: '||w_job(i.job_id));
    END LOOP;
END;
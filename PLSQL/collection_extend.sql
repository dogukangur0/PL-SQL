-- COLLECTION METHODS (EXTEND)
-- varray olu�turuldu�unda -> TYPE varray_type IS ARRAY OF INTEGER NOT NULL; �eklinde belirtmemiz gerekir. Yoksa extend(x,y) 2 parametreli halini kullanamay�z.

DECLARE
    TYPE ndt_type IS TABLE OF INTEGER;
    ndt_dizi ndt_type := ndt_type(10,20,30,40);
    i integer;
BEGIN
    i := ndt_dizi.first;
    WHILE i IS NOT NULL LOOP
        dbms_output.put_line('Dizi('||i||'): '||ndt_dizi(i));
        i := ndt_dizi.next(i);
    END LOOP;
    dbms_output.put_line('------------');
    
    -- ndt_dizi.extend       -> dizinin sonuna bir alan ay�r�r.
    -- ndt_dizi.extend(2)    -> dizinin sonuna parametre i�erisindeki de�er kadar alan ay�r�r.
    -- ndt_dizi.extend(2,1)  -> birinci parametre ka� alan ay�raca��n�, ikinci parametre ise ayr�lan alana hangi indexteki de�erlerin gelece�ini belirler.
    
    ndt_dizi.extend(2,1);
      i := ndt_dizi.first;
    WHILE i IS NOT NULL LOOP
        dbms_output.put_line('Dizi('||i||'): '||ndt_dizi(i));
        i := ndt_dizi.next(i);
    END LOOP;
    
    
    dbms_output.put_line('------------');
     ndt_dizi.extend(2);  -- alan olu�turur ancak i�erisi bo�
      i := ndt_dizi.first;
    WHILE i IS NOT NULL LOOP
        dbms_output.put_line('Dizi('||i||'): '||ndt_dizi(i));
        i := ndt_dizi.next(i);
    END LOOP;
    
    
END;
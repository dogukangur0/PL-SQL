-- COLLECTION METHODS (EXTEND)
-- varray oluþturulduðunda -> TYPE varray_type IS ARRAY OF INTEGER NOT NULL; þeklinde belirtmemiz gerekir. Yoksa extend(x,y) 2 parametreli halini kullanamayýz.

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
    
    -- ndt_dizi.extend       -> dizinin sonuna bir alan ayýrýr.
    -- ndt_dizi.extend(2)    -> dizinin sonuna parametre içerisindeki deðer kadar alan ayýrýr.
    -- ndt_dizi.extend(2,1)  -> birinci parametre kaç alan ayýracaðýný, ikinci parametre ise ayrýlan alana hangi indexteki deðerlerin geleceðini belirler.
    
    ndt_dizi.extend(2,1);
      i := ndt_dizi.first;
    WHILE i IS NOT NULL LOOP
        dbms_output.put_line('Dizi('||i||'): '||ndt_dizi(i));
        i := ndt_dizi.next(i);
    END LOOP;
    
    
    dbms_output.put_line('------------');
     ndt_dizi.extend(2);  -- alan oluþturur ancak içerisi boþ
      i := ndt_dizi.first;
    WHILE i IS NOT NULL LOOP
        dbms_output.put_line('Dizi('||i||'): '||ndt_dizi(i));
        i := ndt_dizi.next(i);
    END LOOP;
    
    
END;
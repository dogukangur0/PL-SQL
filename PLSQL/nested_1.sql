-- Collection Data Types 
-- Nested Tables

-- TYPE <veriTipi_ismi> IS TABLE OF <deger_veri_tipi>;(daima integer)  INDEX BY <index_veri_tipi bu kýsým yazýlmaz.

DECLARE
    TYPE ndt_isimler IS TABLE OF VARCHAR2(10);
    TYPE ndt_puanlar IS TABLE OF INTEGER;
    
    isimler ndt_isimler;
    puanlar ndt_puanlar;
BEGIN
    isimler := ndt_isimler('Dogukan','Mehmet','Caner','Fatma');
    puanlar := ndt_puanlar(10,20,30,40);
    
    dbms_output.put_line('Toplam ogrenci sayisi: '|| isimler.count);
    
    FOR i IN 1..isimler.count LOOP
        dbms_output.put_line('Ogrenci adi: '|| isimler(i) || ' Notu: '|| puanlar(i));
    END LOOP;
END;
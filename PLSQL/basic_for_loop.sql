BEGIN 
    FOR sayac IN 1..5 LOOP  -- FOR sayac IN REVERSE 1..5 LOOP dersek tersten saymaya baþlar.
        EXIT WHEN sayac = 3;  -- ÝLK BURAYI GÖRDÜÐÜ ÝÇÝN ÇIKTI 3 YAZMAZ.
        CONTINUE WHEN sayac = 3; -- 3 deðerini okuduðunda yazmaz bir sonraki döngüden devam eder.
        dbms_output.put_line('Sayac '||sayac);
        EXIT WHEN sayac = 3; -- YAZDIKTAN SONRA EXIT OLDUÐU ÝÇÝN ÇIKTI 3 DEÐERÝNÝ DE VERÝR.
    END LOOP;
END;
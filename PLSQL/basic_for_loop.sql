BEGIN 
    FOR sayac IN 1..5 LOOP  -- FOR sayac IN REVERSE 1..5 LOOP dersek tersten saymaya ba�lar.
        EXIT WHEN sayac = 3;  -- �LK BURAYI G�RD��� ���N �IKTI 3 YAZMAZ.
        CONTINUE WHEN sayac = 3; -- 3 de�erini okudu�unda yazmaz bir sonraki d�ng�den devam eder.
        dbms_output.put_line('Sayac '||sayac);
        EXIT WHEN sayac = 3; -- YAZDIKTAN SONRA EXIT OLDU�U ���N �IKTI 3 DE�ER�N� DE VER�R.
    END LOOP;
END;

DECLARE
    sayac number;  -- sayac number := 0; ilk de�er verilebilir.
BEGIN
    loop
        sayac := nvl(sayac,0)+1;   -- i�erde null olup olmad��� kontrol edilebilir.
        dbms_output.put_line(sayac);
        
        if sayac = 5 then
            exit;
        end if;
        
        exit when sayac = 5;
        -- bir s�n�ra ula�t���nda iki kullan�m �ekli uygundur.
        
        
        if mod(sayac,2)=0 then
            continue;  -- 2'ye b�l�n�yorsa devam etme, loop'a geri d�n.
        end if;
        
        continue when mod(sayac,2)=0;
        
    end loop;
END;
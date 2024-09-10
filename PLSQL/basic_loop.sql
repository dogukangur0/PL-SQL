
DECLARE
    sayac number;  -- sayac number := 0; ilk deðer verilebilir.
BEGIN
    loop
        sayac := nvl(sayac,0)+1;   -- içerde null olup olmadýðý kontrol edilebilir.
        dbms_output.put_line(sayac);
        
        if sayac = 5 then
            exit;
        end if;
        
        exit when sayac = 5;
        -- bir sýnýra ulaþtýðýnda iki kullaným þekli uygundur.
        
        
        if mod(sayac,2)=0 then
            continue;  -- 2'ye bölünüyorsa devam etme, loop'a geri dön.
        end if;
        
        continue when mod(sayac,2)=0;
        
    end loop;
END;
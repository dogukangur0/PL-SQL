
DECLARE
    rec_kurs KURSLAR%rowtype;
BEGIN
  
    rec_kurs.egitmen       := 'X';
    rec_kurs.start_date    := trunc(sysdate);
    rec_kurs.finish_date   := rec_kurs.start_date + 5;
    
    
    loop
          rec_kurs.kurs_id := nvl(rec_kurs.kurs_id,0)+1;
          
          if rec_kurs.kurs_id = 2 then contiune; end if;
          
          EXIT WHEN rec_kurs.kurs_id = 4;
          
          --if rec_kurs.kurs_id = 4 then exit; end if;
          
          CASE rec_kurs.kurs_id
            WHEN 1 THEN rec_kurs.kurs_ad := 'Oracle SQL';
            WHEN 2 THEN rec_kurs.kurs_ad := 'PL/SQL';
            WHEN 3 THEN rec_kurs.kurs_ad := 'Oracle DBA';
          END CASE;
          
          -- select ve case kullanýmý
          
          SELECT DECODE(rec_kurs.kurs_id,
                        1,'Oracle SQL',
                        2,'PL/SQL',
                        3,'Oracle DBA')
                        INTO rec_kurs.kurs_ad FROM DUAL;
         /*
             SELECT DECODE (ifade,
                            ifadenin deðeri,diðer sütundaki karþýlýðý,
                            ifadenin deðeri,diðer sütundaki karþýlýðý,
                            ifadenin deðeri,diðer sütundaki karþýlýðý)
                            INTO diðer sütunun adý FROM tablo;
         */
         
         INSERT INTO KURSLAR (kurs_id,
                              kurs_ad,
                              egitmen,
                              start_date,
                              finish_date)
                              VALUES (rec_kurs.kurs_id,
                                      rec_kurs.kurs_ad,
                                      rec_kurs.egitmen,
                                      rec_kurs.start_date,
                                      rec_kurs.finish_date);
                                      
        rec_kurs.start_date := rec_kurs.finish_date +1;
        rec_kurs.finish_date := rec_kurs.start_date +4;
          
    end loop;
    
END;




/*
create table KURSLAR (
                      kurs_id     number(3),
                      kurs_ad     varchar2(50),
                      egitmen     varchar2(50),
                      start_date  date,
                      finish_date date);
                      
                      
select * from KURSLAR;

delete from KURSLAR;

commit;
  */                    
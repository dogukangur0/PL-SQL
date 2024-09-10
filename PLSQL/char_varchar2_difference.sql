DECLARE
    w_ad     CHAR(15);
    w_soyad  VARCHAR2(15);
BEGIN
    w_ad := 'Dogukan';
    w_soyad := 'Gur';
    
    DBMS_OUTPUT.PUT_LINE(w_ad);
    DBMS_OUTPUT.PUT_LINE(w_soyad);
    
    DBMS_OUTPUT.PUT_LINE('*' || w_ad || '*');
    DBMS_OUTPUT.PUT_LINE('*' || w_soyad || '*');
    
    /*
        char, içerisinde belirlenen alan kadar bellekte yer ayýrýr.
        varchar2, alan belirtilir ancak kullandýðý kadar bellekte yer ayýrýr. 
    */
END;
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
        char, i�erisinde belirlenen alan kadar bellekte yer ay�r�r.
        varchar2, alan belirtilir ancak kulland��� kadar bellekte yer ay�r�r. 
    */
END;
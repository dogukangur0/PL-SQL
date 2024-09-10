-- PLS_INTEGER, BINARY_INTEGER, NUMBER
-- PLS_INTEGER - BINARY_INTEGER Overflow (Aþýrý Yüklenme)

DECLARE
    p1 PLS_INTEGER := 2147483647;
    p2 PLS_INTEGER := 0;
    
    n NUMBER;
BEGIN
    n := p1+p2;
    DBMS_OUTPUT.PUT_LINE(n);
END;

DECLARE 
    p1 BINARY_INTEGER := 2147483647;
    p2 BINARY_INTEGER := 1;
    
    n NUMBER;
BEGIN
    n := p1+p2;
    DBMS_OUTPUT.PUT_LINE(n);
END;

/*
    2147483647 MAX DEÐER
    bunun üzerinde bir deðer olduðunda overflow meydana gelir, hata oluþur.
    n := p1+p2 gibi toplama iþlemlerinde p1 ve p2 toplandýktan sonra direkt n deðerine atanmaz
    p1 ve p2 kendi içerisinde toplanýr ve ardýndan uygun olan p1 veya p2'ye atanýr ardýndan n'ye atama yapýlýr.
    max deðer aþýldýðýnda atama yapamaz ve hata meydana gelir.
*/

DECLARE 
    p1 BINARY_INTEGER := 2147483647;
    p2 NUMBER := 1;
    
    n NUMBER;
BEGIN
    n := p1+p2;
    DBMS_OUTPUT.PUT_LINE(n);
END;

/*
    p1 ve p2 kendi içerisinde toplanýr uygun olan 'NUMBER'  deðiþkenine atanýr ardýndan n'ye atama yapýlýr.
*/


-- PLS_INTEGER, BINARY_INTEGER, NUMBER
-- PLS_INTEGER - BINARY_INTEGER Overflow (A��r� Y�klenme)

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
    2147483647 MAX DE�ER
    bunun �zerinde bir de�er oldu�unda overflow meydana gelir, hata olu�ur.
    n := p1+p2 gibi toplama i�lemlerinde p1 ve p2 topland�ktan sonra direkt n de�erine atanmaz
    p1 ve p2 kendi i�erisinde toplan�r ve ard�ndan uygun olan p1 veya p2'ye atan�r ard�ndan n'ye atama yap�l�r.
    max de�er a��ld���nda atama yapamaz ve hata meydana gelir.
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
    p1 ve p2 kendi i�erisinde toplan�r uygun olan 'NUMBER'  de�i�kenine atan�r ard�ndan n'ye atama yap�l�r.
*/


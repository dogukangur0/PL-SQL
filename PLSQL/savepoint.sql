-- PL/SQL içinde SQL komutlarýnýn kullanýmý (Static SQL - DML - TCL)  Savepoint

DECLARE
   
BEGIN
    INSERT INTO regions2(region_id, region_name) VALUES (1,'Istanbul');
    SAVEPOINT X;
    
    INSERT INTO regions2(region_id, region_name) VALUES (2,'Ankara');
    SAVEPOINT Y;
    
    UPDATE regions2 SET region_name = 'Sivas' WHERE region_id = 1;
    SAVEPOINT Z;
    
    DELETE FROM regions2 WHERE region_id = 2;
    
    ROLLBACK TO X; -- X'e kadar olan iþlemleri yapar.
    ROLLBACK TO Y; -- Y'ye kadar olan iþlemleri yapar.
    ROLLBACK TO Z; -- Z'ye kadar olan iþlemleri yapar.
    
    ROLLBACK;      -- tüm iþlemleri iptal eder.
    
    COMMIT;        -- iþlemleri kaydeder.
END;

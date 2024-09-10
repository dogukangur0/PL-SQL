-- blob kullan�m�

create table IMAGES (
                     fileName varchar2(100) PRIMARY KEY,
                     fileImage blob
                     );
                     
DECLARE
    photo             BFILE;
    tempdata          BLOB; --file sistemden resmi okuyup �zerine ataca��m�z de�i�ken.
    sourceOffset      PLS_INTEGER :=1; -- resmin kalitesini belirler. 1-> %100 kaliteli
    destinationOffset PLS_INTEGER :=1;
    
BEGIN
    dbms_lob.CreateTemporary(tempdata, true);      -- ge�ici alan tempdata �zerine olu�turuldu.
    -- lob-> large object binary
    -- CreateTemporary -> ge�ici alan olu�turur.
    
    photo := BFILENAME('IMAGE_DIR', 'araba.jpg');  -- bfilename 2 parametre al�r 1-> directory, 2-> directory i�erisindeki resim
    dbms_lob.FileOpen(photo, dbms_lob.FILE_READONLY);
    dbms_lob.LoadFromFile(tempdata, photo, dbms_lob.LOBMAXSIZE, destinationOffset, sourceOffset);
    -- loadfromfile -> photodan okuyup tempdata i�erisine atacak max boyutta
    
    INSERT INTO IMAGES (fileName, fileImage) VALUES ('araba.jpg', tempdata);
    commit;
    
    dbms_lob.FileClose(photo);
END;



/*
-- directory sys i�erisinde olu�turulur, hr'nin yetkisi yoktur.

CREATE DIRECTORY IMAGE_DIR AS 'c:\plresim';

GRANT READ, WRITE ON DIRECTORY IMAGE_DIR TO HR;

*/

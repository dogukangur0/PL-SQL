-- blob kullanýmý

create table IMAGES (
                     fileName varchar2(100) PRIMARY KEY,
                     fileImage blob
                     );
                     
DECLARE
    photo             BFILE;
    tempdata          BLOB; --file sistemden resmi okuyup üzerine atacaðýmýz deðiþken.
    sourceOffset      PLS_INTEGER :=1; -- resmin kalitesini belirler. 1-> %100 kaliteli
    destinationOffset PLS_INTEGER :=1;
    
BEGIN
    dbms_lob.CreateTemporary(tempdata, true);      -- geçici alan tempdata üzerine oluþturuldu.
    -- lob-> large object binary
    -- CreateTemporary -> geçici alan oluþturur.
    
    photo := BFILENAME('IMAGE_DIR', 'araba.jpg');  -- bfilename 2 parametre alýr 1-> directory, 2-> directory içerisindeki resim
    dbms_lob.FileOpen(photo, dbms_lob.FILE_READONLY);
    dbms_lob.LoadFromFile(tempdata, photo, dbms_lob.LOBMAXSIZE, destinationOffset, sourceOffset);
    -- loadfromfile -> photodan okuyup tempdata içerisine atacak max boyutta
    
    INSERT INTO IMAGES (fileName, fileImage) VALUES ('araba.jpg', tempdata);
    commit;
    
    dbms_lob.FileClose(photo);
END;



/*
-- directory sys içerisinde oluþturulur, hr'nin yetkisi yoktur.

CREATE DIRECTORY IMAGE_DIR AS 'c:\plresim';

GRANT READ, WRITE ON DIRECTORY IMAGE_DIR TO HR;

*/

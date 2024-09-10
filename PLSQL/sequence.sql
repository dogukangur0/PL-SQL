-- Pseudocolumns Kullan�m� (Tabloda olmayan bir kolonu tablonun bir kolonuymu� gibi davrand�rmak)


DECLARE
    seq_number number;
    seq_another_number number;
BEGIN
    seq_number := test_seq.nextval;
    INSERT INTO regions (region_id, region_name) VALUES (seq_number, 'Antartica');
    
    seq_another_number := test_seq.currval;
    UPDATE regions SET region_name = 'Gronland' WHERE region_id = seq_another_number;
    
    commit;
END;

desc regions;

select * from regions;

create sequence test_seq start with 5 increment by 1;

/*
    test_seq ad�nda bir sequence olu�turulur . 
    ba�lang�� de�eri ve art�� miktar� belirlenir.
    seq_number ad�nda bir obj olu�turuldu ve test_seq.nextval de�eri verildi
    insert ile eklenecek yer belirlendi
    update etmek i�in seq_number'�n mevcut de�eri currval ile al�nd� ve i�lem ger�ekle�tirildi.
*/
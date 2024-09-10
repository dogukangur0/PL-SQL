-- Pseudocolumns Kullanýmý (Tabloda olmayan bir kolonu tablonun bir kolonuymuþ gibi davrandýrmak)


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
    test_seq adýnda bir sequence oluþturulur . 
    baþlangýç deðeri ve artýþ miktarý belirlenir.
    seq_number adýnda bir obj oluþturuldu ve test_seq.nextval deðeri verildi
    insert ile eklenecek yer belirlendi
    update etmek için seq_number'ýn mevcut deðeri currval ile alýndý ve iþlem gerçekleþtirildi.
*/
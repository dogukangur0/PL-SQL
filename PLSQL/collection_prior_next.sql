-- COLLECTÝON METHODS (PRIOR - NEXT)

DECLARE 
    TYPE varray_type IS VARRAY(10) OF NUMBER;
    varray_type_obj varray_type := varray_type();
BEGIN
    varray_type_obj.EXTEND(4); -- parametre kadar yer ayýrýr.
    varray_type_obj(1) := 10;
    varray_type_obj(2) := 20;
    varray_type_obj(3) := 30;
    varray_type_obj(4) := 40;
    
    dbms_output.put_line('varray_type_obj(3) sayisinin prior deðeri: '||varray_type_obj.PRIOR(3));
    dbms_output.put_line('varray_type_obj(3) sayisinin next deðeri: '||varray_type_obj.NEXT(3));
    
    dbms_output.put_line('varray_type_obj(6) sayisinin prior deðeri: '||varray_type_obj.PRIOR(6)); -- 6 veri yok 1 öncesi 5 ama deðer yok. en yakýn dolu yeri iþaret eder. 
END;
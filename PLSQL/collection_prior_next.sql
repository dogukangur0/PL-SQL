-- COLLECT�ON METHODS (PRIOR - NEXT)

DECLARE 
    TYPE varray_type IS VARRAY(10) OF NUMBER;
    varray_type_obj varray_type := varray_type();
BEGIN
    varray_type_obj.EXTEND(4); -- parametre kadar yer ay�r�r.
    varray_type_obj(1) := 10;
    varray_type_obj(2) := 20;
    varray_type_obj(3) := 30;
    varray_type_obj(4) := 40;
    
    dbms_output.put_line('varray_type_obj(3) sayisinin prior de�eri: '||varray_type_obj.PRIOR(3));
    dbms_output.put_line('varray_type_obj(3) sayisinin next de�eri: '||varray_type_obj.NEXT(3));
    
    dbms_output.put_line('varray_type_obj(6) sayisinin prior de�eri: '||varray_type_obj.PRIOR(6)); -- 6 veri yok 1 �ncesi 5 ama de�er yok. en yak�n dolu yeri i�aret eder. 
END;
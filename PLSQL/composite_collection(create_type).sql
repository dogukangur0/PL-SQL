DECLARE

    WDEPARTMENT_ID     DEPARTMENTS.DEPARTMENT_ID%TYPE;  
    WDEPARTMENT_NAME   DEPARTMENTS.DEPARTMENT_NAME%TYPE; 
    WMANAGER_ID        DEPARTMENTS.MANAGER_ID%TYPE;
    WLOCATION_ID       DEPARTMENTS.LOCATION_ID%TYPE;
    
    TYPE t_dept IS RECORD ( dept_id number(4),
                            dept_name departments.department_name%type,
                            dept_manager_id departments.manager_id%type NOT NULL DEFAULT 0
                           );
    
    obj_t_dept t_dept;
BEGIN
   SELECT department_id, department_name, manager_id INTO obj_t_dept FROM departments WHERE department_id = 10;
    
    DBMS_OUTPUT.PUT_LINE(obj_t_dept.dept_id ||' '|| obj_t_dept.dept_name || ' ' || obj_t_dept.dept_manager_id);

END;

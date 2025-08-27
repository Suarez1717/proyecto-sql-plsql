CREATE OR REPLACE PROCEDURE cur_buscar_producto(p_nombre IN VARCHAR2, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM productos WHERE UPPER(nombre) LIKE '%'||UPPER(p_nombre)||'%';
END;
/



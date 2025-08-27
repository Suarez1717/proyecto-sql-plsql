CREATE OR REPLACE PROCEDURE cur_productos_sin_ventas(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT p.* FROM productos p LEFT JOIN ventas v ON v.id_producto = p.id
    WHERE v.id IS NULL;
END;
/

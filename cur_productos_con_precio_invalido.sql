CREATE OR REPLACE PROCEDURE cur_productos_con_precio_invalido(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM productos WHERE precio IS NULL OR precio < 0;
END;
/

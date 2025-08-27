CREATE OR REPLACE PROCEDURE cur_productos_agotados(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR SELECT * FROM productos WHERE stock = 0;
END;
/

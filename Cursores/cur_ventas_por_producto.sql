CREATE OR REPLACE PROCEDURE cur_ventas_por_producto(p_id IN NUMBER, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR SELECT * FROM ventas WHERE id_producto = p_id;
END;
/

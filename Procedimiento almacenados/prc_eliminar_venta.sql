CREATE OR REPLACE PROCEDURE prc_eliminar_venta(p_id_venta IN NUMBER) AS
BEGIN
  DELETE FROM ventas WHERE id = p_id_venta;
END;
/

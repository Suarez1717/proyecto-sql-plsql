CREATE OR REPLACE PROCEDURE prc_anular_venta(p_id_venta IN NUMBER) AS
  v_id_producto NUMBER; v_cantidad NUMBER;
BEGIN
  SELECT id_producto, cantidad INTO v_id_producto, v_cantidad FROM ventas WHERE id = p_id_venta FOR UPDATE;
  DELETE FROM ventas WHERE id = p_id_venta;
  UPDATE productos SET stock = NVL(stock,0) + NVL(v_cantidad,0) WHERE id = v_id_producto;
END;
/

CREATE OR REPLACE PROCEDURE prc_insertar_venta(
  p_id_producto IN NUMBER, p_cantidad IN NUMBER, p_precio IN NUMBER, p_fecha IN DATE := SYSDATE
) AS
BEGIN
  INSERT INTO ventas(id_producto, cantidad, precio, fecha_venta)
  VALUES (p_id_producto, p_cantidad, p_precio, NVL(p_fecha,SYSDATE));
END;
/

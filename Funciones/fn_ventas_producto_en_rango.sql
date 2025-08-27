CREATE OR REPLACE FUNCTION fn_ventas_producto_en_rango(
  p_id IN NUMBER, p_fi IN DATE, p_ff IN DATE
) RETURN NUMBER IS
  v NUMBER := 0;
BEGIN
  SELECT NVL(SUM(cantidad),0) INTO v
  FROM ventas
  WHERE id_producto = p_id
    AND fecha_venta >= TRUNC(p_fi)
    AND fecha_venta <  TRUNC(p_ff) + 1;
  RETURN v;
END;
/

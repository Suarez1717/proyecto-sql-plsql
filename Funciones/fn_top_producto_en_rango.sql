CREATE OR REPLACE FUNCTION fn_top_producto_en_rango(
  p_fi IN DATE, p_ff IN DATE
) RETURN NUMBER IS
  v_id NUMBER;
BEGIN
  SELECT id_producto INTO v_id
  FROM (
    SELECT id_producto, SUM(cantidad) s
    FROM ventas
    WHERE fecha_venta >= TRUNC(p_fi) AND fecha_venta < TRUNC(p_ff)+1
    GROUP BY id_producto
    ORDER BY s DESC
  ) WHERE ROWNUM=1;
  RETURN v_id;
EXCEPTION WHEN NO_DATA_FOUND THEN RETURN NULL; END;
/

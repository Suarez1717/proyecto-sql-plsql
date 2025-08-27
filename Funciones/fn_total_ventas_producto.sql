CREATE OR REPLACE FUNCTION fn_total_ventas_producto(p_id IN NUMBER) RETURN NUMBER IS
  v_total NUMBER := 0;
BEGIN
  SELECT NVL(SUM(cantidad),0) INTO v_total FROM ventas WHERE id_producto = p_id;
  RETURN v_total;
END;
/

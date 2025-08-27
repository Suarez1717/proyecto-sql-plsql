CREATE OR REPLACE FUNCTION fn_ultima_venta_producto(p_id IN NUMBER) RETURN DATE IS
  v DATE;
BEGIN
  SELECT MAX(fecha_venta) INTO v FROM ventas WHERE id_producto = p_id;
  RETURN v;
END;
/

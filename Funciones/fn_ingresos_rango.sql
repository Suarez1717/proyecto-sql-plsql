CREATE OR REPLACE FUNCTION fn_ingresos_rango(p_fi IN DATE, p_ff IN DATE) RETURN NUMBER IS
  v NUMBER := 0;
BEGIN
  SELECT NVL(SUM(cantidad*precio),0) INTO v
  FROM ventas
  WHERE fecha_venta >= TRUNC(p_fi) AND fecha_venta < TRUNC(p_ff)+1;
  RETURN v;
END;
/

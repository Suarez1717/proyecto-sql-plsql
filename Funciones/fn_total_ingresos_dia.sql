CREATE OR REPLACE FUNCTION fn_total_ingresos_dia(p_fecha IN DATE) RETURN NUMBER IS
  v_total NUMBER := 0;
BEGIN
  SELECT NVL(SUM(cantidad*precio),0) INTO v_total 
  FROM ventas WHERE TRUNC(fecha_venta)=TRUNC(p_fecha);
  RETURN v_total;
END;
/

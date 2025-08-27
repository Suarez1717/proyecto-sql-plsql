CREATE OR REPLACE PACKAGE pkg_consultas_ventas AS
  FUNCTION total_dia(p_fecha IN DATE) RETURN NUMBER;
  FUNCTION ingresos_dia(p_fecha IN DATE) RETURN NUMBER;
  FUNCTION ventas_producto_en_rango(p_id IN NUMBER, p_fi IN DATE, p_ff IN DATE) RETURN NUMBER;
END pkg_consultas_ventas;
/

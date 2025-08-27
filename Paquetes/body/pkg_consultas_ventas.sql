CREATE OR REPLACE PACKAGE BODY pkg_consultas_ventas AS
  FUNCTION total_dia(p_fecha IN DATE) RETURN NUMBER IS
  BEGIN RETURN fn_total_ventas_dia(p_fecha); END;
  FUNCTION ingresos_dia(p_fecha IN DATE) RETURN NUMBER IS
  BEGIN RETURN fn_total_ingresos_dia(p_fecha); END;
  FUNCTION ventas_producto_en_rango(p_id IN NUMBER, p_fi IN DATE, p_ff IN DATE) RETURN NUMBER IS
  BEGIN RETURN fn_ventas_producto_en_rango(p_id, p_fi, p_ff); END;
END pkg_consultas_ventas;
/

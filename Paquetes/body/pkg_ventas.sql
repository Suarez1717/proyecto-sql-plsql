CREATE OR REPLACE PACKAGE BODY pkg_ventas AS
  PROCEDURE registrar(p_id_producto IN NUMBER, p_cantidad IN NUMBER, p_precio IN NUMBER, p_fecha IN DATE) IS
  BEGIN prc_insertar_venta(p_id_producto, p_cantidad, p_precio, p_fecha); END;
  PROCEDURE anular(p_id_venta IN NUMBER) IS
  BEGIN prc_anular_venta(p_id_venta); END;
  PROCEDURE eliminar(p_id_venta IN NUMBER) IS
  BEGIN prc_eliminar_venta(p_id_venta); END;
  FUNCTION ingresos_rango(p_fi IN DATE, p_ff IN DATE) RETURN NUMBER IS
  BEGIN RETURN fn_ingresos_rango(p_fi, p_ff); END;
END pkg_ventas;
/

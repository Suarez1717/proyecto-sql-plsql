CREATE OR REPLACE PACKAGE pkg_ventas AS
  PROCEDURE registrar(p_id_producto IN NUMBER, p_cantidad IN NUMBER, p_precio IN NUMBER, p_fecha IN DATE := NULL);
  PROCEDURE anular(p_id_venta IN NUMBER);
  PROCEDURE eliminar(p_id_venta IN NUMBER);
  FUNCTION  ingresos_rango(p_fi IN DATE, p_ff IN DATE) RETURN NUMBER;
END pkg_ventas;
/

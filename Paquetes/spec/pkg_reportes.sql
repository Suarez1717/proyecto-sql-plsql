CREATE OR REPLACE PACKAGE pkg_reportes AS
  PROCEDURE ventas_dia(p_fecha IN DATE, p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_rango(p_fi IN DATE, p_ff IN DATE, p_rc OUT SYS_REFCURSOR);
  PROCEDURE top_productos(p_limit IN NUMBER, p_rc OUT SYS_REFCURSOR);
  PROCEDURE ingresos_por_producto(p_rc OUT SYS_REFCURSOR);
END pkg_reportes;
/

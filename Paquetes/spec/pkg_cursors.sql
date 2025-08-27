CREATE OR REPLACE PACKAGE pkg_cursors AS
  PROCEDURE productos(p_rc OUT SYS_REFCURSOR);
  PROCEDURE productos_agotados(p_rc OUT SYS_REFCURSOR);
  PROCEDURE productos_sin_ventas(p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_dia(p_fecha IN DATE, p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_rango(p_fi IN DATE, p_ff IN DATE, p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_por_producto(p_id IN NUMBER, p_rc OUT SYS_REFCURSOR);
  PROCEDURE top_productos(p_limit IN NUMBER, p_rc OUT SYS_REFCURSOR);
  PROCEDURE ingresos_por_dia(p_rc OUT SYS_REFCURSOR);
  PROCEDURE ingresos_por_producto(p_rc OUT SYS_REFCURSOR);
  PROCEDURE valor_inventario(p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_ultimos_7_dias(p_rc OUT SYS_REFCURSOR);
  PROCEDURE productos_con_precio_invalido(p_rc OUT SYS_REFCURSOR);
  PROCEDURE ventas_mes(p_yyyymm IN VARCHAR2, p_rc OUT SYS_REFCURSOR);
  PROCEDURE buscar_producto(p_nombre IN VARCHAR2, p_rc OUT SYS_REFCURSOR);
  PROCEDURE buscar_usuario(p_texto IN VARCHAR2, p_rc OUT SYS_REFCURSOR);
END pkg_cursors;
/

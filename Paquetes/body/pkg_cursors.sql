CREATE OR REPLACE PACKAGE BODY pkg_cursors AS
  PROCEDURE productos(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_listar_productos(p_rc); END;
  PROCEDURE productos_agotados(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_productos_agotados(p_rc); END;
  PROCEDURE productos_sin_ventas(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_productos_sin_ventas(p_rc); END;
  PROCEDURE ventas_dia(p_fecha IN DATE, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ventas_dia(p_fecha, p_rc); END;
  PROCEDURE ventas_rango(p_fi IN DATE, p_ff IN DATE, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ventas_rango(p_fi, p_ff, p_rc); END;
  PROCEDURE ventas_por_producto(p_id IN NUMBER, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ventas_por_producto(p_id, p_rc); END;
  PROCEDURE top_productos(p_limit IN NUMBER, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_top_productos(p_limit, p_rc); END;
  PROCEDURE ingresos_por_dia(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ingresos_por_dia(p_rc); END;
  PROCEDURE ingresos_por_producto(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ingresos_por_producto(p_rc); END;
  PROCEDURE valor_inventario(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_valor_inventario(p_rc); END;
  PROCEDURE ventas_ultimos_7_dias(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ventas_ultimos_7_dias(p_rc); END;
  PROCEDURE productos_con_precio_invalido(p_rc OUT SYS_REFCURSOR) IS BEGIN cur_productos_con_precio_invalido(p_rc); END;
  PROCEDURE ventas_mes(p_yyyymm IN VARCHAR2, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_ventas_mes(p_yyyymm, p_rc); END;
  PROCEDURE buscar_producto(p_nombre IN VARCHAR2, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_buscar_producto(p_nombre, p_rc); END;
  PROCEDURE buscar_usuario(p_texto IN VARCHAR2, p_rc OUT SYS_REFCURSOR) IS BEGIN cur_buscar_usuario(p_texto, p_rc); END;
END pkg_cursors;
/

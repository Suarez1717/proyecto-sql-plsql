CREATE OR REPLACE PACKAGE BODY pkg_reportes AS
  PROCEDURE ventas_dia(p_fecha IN DATE, p_rc OUT SYS_REFCURSOR) IS
  BEGIN cur_ventas_dia(p_fecha, p_rc); END;
  PROCEDURE ventas_rango(p_fi IN DATE, p_ff IN DATE, p_rc OUT SYS_REFCURSOR) IS
  BEGIN cur_ventas_rango(p_fi, p_ff, p_rc); END;
  PROCEDURE top_productos(p_limit IN NUMBER, p_rc OUT SYS_REFCURSOR) IS
  BEGIN cur_top_productos(p_limit, p_rc); END;
  PROCEDURE ingresos_por_producto(p_rc OUT SYS_REFCURSOR) IS
  BEGIN cur_ingresos_por_producto(p_rc); END;
END pkg_reportes;
/

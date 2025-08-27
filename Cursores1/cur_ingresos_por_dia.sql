CREATE OR REPLACE PROCEDURE cur_ingresos_por_dia(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT TRUNC(fecha_venta) fecha, SUM(cantidad*precio) ingresos
    FROM ventas GROUP BY TRUNC(fecha_venta) ORDER BY fecha;
END;
/

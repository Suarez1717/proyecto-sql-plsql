CREATE OR REPLACE PROCEDURE cur_ventas_dia(p_fecha IN DATE, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR SELECT * FROM ventas WHERE TRUNC(fecha_venta)=TRUNC(p_fecha);
END;
/

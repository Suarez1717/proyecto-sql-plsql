CREATE OR REPLACE PROCEDURE cur_ventas_ultimos_7_dias(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM ventas WHERE fecha_venta >= TRUNC(SYSDATE)-7;
END;
/

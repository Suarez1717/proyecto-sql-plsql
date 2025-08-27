CREATE OR REPLACE PROCEDURE cur_ventas_rango(p_fi IN DATE, p_ff IN DATE, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR 
    SELECT * FROM ventas 
    WHERE fecha_venta >= TRUNC(p_fi) AND fecha_venta < TRUNC(p_ff)+1;
END;
/

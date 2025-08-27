CREATE OR REPLACE PROCEDURE cur_ventas_mes(p_yyyymm IN VARCHAR2, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM ventas
    WHERE TO_CHAR(fecha_venta,'YYYYMM') = p_yyyymm;
END;
/

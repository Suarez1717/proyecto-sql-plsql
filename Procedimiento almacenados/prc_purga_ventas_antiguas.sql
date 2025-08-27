CREATE OR REPLACE PROCEDURE prc_purga_ventas_antiguas(p_antig_dias IN NUMBER) AS
BEGIN
  DELETE FROM ventas WHERE fecha_venta < TRUNC(SYSDATE) - NVL(p_antig_dias, 365);
END;
/

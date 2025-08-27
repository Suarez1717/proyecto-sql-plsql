CREATE OR REPLACE VIEW v_ventas_ultimos_7_dias AS
SELECT * FROM ventas WHERE fecha_venta >= TRUNC(SYSDATE) - 7;
/

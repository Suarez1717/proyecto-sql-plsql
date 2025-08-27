CREATE OR REPLACE VIEW v_ingresos_por_dia AS
SELECT TRUNC(fecha_venta) AS fecha,
       SUM(cantidad*precio) AS ingresos
FROM ventas
GROUP BY TRUNC(fecha_venta);
/

CREATE OR REPLACE VIEW v_ventas_por_dia AS
SELECT TRUNC(fecha_venta) AS fecha,
       SUM(cantidad) AS total_ventas,
       SUM(cantidad*precio) AS ingresos
FROM ventas
GROUP BY TRUNC(fecha_venta);
/

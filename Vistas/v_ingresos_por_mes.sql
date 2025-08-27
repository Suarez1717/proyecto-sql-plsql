CREATE OR REPLACE VIEW v_ingresos_por_mes AS
SELECT TO_CHAR(fecha_venta,'YYYYMM') AS yyyymm,
       SUM(cantidad*precio) AS ingresos
FROM ventas
GROUP BY TO_CHAR(fecha_venta,'YYYYMM');
/

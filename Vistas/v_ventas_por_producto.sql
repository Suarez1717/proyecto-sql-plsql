CREATE OR REPLACE VIEW v_ventas_por_producto AS
SELECT p.id AS id_producto, p.nombre,
       NVL(SUM(v.cantidad),0) AS cantidad_total
FROM productos p
LEFT JOIN ventas v ON v.id_producto = p.id
GROUP BY p.id, p.nombre;
/

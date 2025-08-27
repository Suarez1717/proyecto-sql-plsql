CREATE OR REPLACE VIEW v_ingresos_por_producto AS
SELECT p.id AS id_producto, p.nombre,
       NVL(SUM(v.cantidad*v.precio),0) AS ingresos
FROM productos p
LEFT JOIN ventas v ON v.id_producto = p.id
GROUP BY p.id, p.nombre;
/

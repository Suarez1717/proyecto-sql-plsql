CREATE OR REPLACE VIEW v_productos_mas_vendidos AS
SELECT id_producto,
       SUM(cantidad) AS total_vendido,
       DENSE_RANK() OVER (ORDER BY SUM(cantidad) DESC) AS ranking
FROM ventas
GROUP BY id_producto;
/

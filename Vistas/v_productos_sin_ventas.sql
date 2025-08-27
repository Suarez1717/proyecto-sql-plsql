CREATE OR REPLACE VIEW v_productos_sin_ventas AS
SELECT p.*
FROM productos p
LEFT JOIN ventas v ON v.id_producto = p.id
WHERE v.id IS NULL;
/

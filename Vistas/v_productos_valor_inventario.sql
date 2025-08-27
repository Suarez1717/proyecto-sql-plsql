CREATE OR REPLACE VIEW v_productos_valor_inventario AS
SELECT id, nombre, precio, stock, (precio*stock) AS valor_inventario
FROM productos;
/

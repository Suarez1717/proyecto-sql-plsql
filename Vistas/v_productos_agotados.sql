CREATE OR REPLACE VIEW v_productos_agotados AS
SELECT id, nombre, stock FROM productos WHERE stock = 0;
/

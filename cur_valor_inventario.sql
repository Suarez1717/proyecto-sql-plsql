CREATE OR REPLACE PROCEDURE cur_valor_inventario(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT id, nombre, precio, stock, (precio*stock) valor_inventario FROM productos;
END;
/

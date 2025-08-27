CREATE OR REPLACE PROCEDURE prc_ajustar_stock_por_devolucion(p_id IN NUMBER, p_cantidad IN NUMBER) AS
BEGIN
  UPDATE productos SET stock = NVL(stock,0) + p_cantidad WHERE id = p_id;
END;
/

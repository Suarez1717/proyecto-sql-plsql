CREATE OR REPLACE PROCEDURE prc_ajustar_stock_por_venta(p_id IN NUMBER, p_cantidad IN NUMBER) AS
  v_stock NUMBER;
BEGIN
  SELECT stock INTO v_stock FROM productos WHERE id = p_id FOR UPDATE;
  IF v_stock < p_cantidad THEN
    RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente');
  END IF;
  UPDATE productos SET stock = stock - p_cantidad WHERE id = p_id;
END;
/

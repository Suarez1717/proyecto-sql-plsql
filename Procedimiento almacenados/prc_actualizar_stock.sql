CREATE OR REPLACE PROCEDURE prc_actualizar_stock(p_id IN NUMBER, p_stock IN NUMBER) AS
BEGIN
  UPDATE productos SET stock = p_stock WHERE id = p_id;
END;
/

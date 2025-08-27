CREATE OR REPLACE PROCEDURE prc_eliminar_producto(p_id IN NUMBER) AS
BEGIN
  DELETE FROM productos WHERE id = p_id;
END;
/

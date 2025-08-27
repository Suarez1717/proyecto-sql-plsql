CREATE OR REPLACE PROCEDURE prc_actualizar_precio_producto(p_id IN NUMBER, p_precio IN NUMBER) AS
BEGIN
  IF p_precio < 0 THEN
    RAISE_APPLICATION_ERROR(-20010, 'Precio no puede ser negativo');
  END IF;
  UPDATE productos SET precio = p_precio WHERE id = p_id;
END;
/

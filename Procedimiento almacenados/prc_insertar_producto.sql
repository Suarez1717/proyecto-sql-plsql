CREATE OR REPLACE PROCEDURE prc_insertar_producto(
  p_nombre IN VARCHAR2, p_precio IN NUMBER, p_stock IN NUMBER
) AS
BEGIN
  INSERT INTO productos(nombre, precio, stock) VALUES (p_nombre, p_precio, p_stock);
END;
/

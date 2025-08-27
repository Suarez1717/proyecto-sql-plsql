CREATE OR REPLACE PROCEDURE prc_insertar_usuario(p_nombre IN VARCHAR2, p_rol IN VARCHAR2) AS
BEGIN
  INSERT INTO usuarios(nombre, rol) VALUES (p_nombre, p_rol);
END;
/

CREATE OR REPLACE PROCEDURE prc_actualizar_usuario(p_id IN NUMBER, p_nombre IN VARCHAR2, p_rol IN VARCHAR2) AS
BEGIN
  UPDATE usuarios SET nombre = p_nombre, rol = p_rol WHERE id = p_id;
END;
/

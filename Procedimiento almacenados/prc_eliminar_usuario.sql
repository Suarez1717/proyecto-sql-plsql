CREATE OR REPLACE PROCEDURE prc_eliminar_usuario(p_id IN NUMBER) AS
BEGIN
  DELETE FROM usuarios WHERE id = p_id;
END;
/

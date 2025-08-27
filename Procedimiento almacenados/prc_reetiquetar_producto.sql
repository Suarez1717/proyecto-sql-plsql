CREATE OR REPLACE PROCEDURE prc_reetiquetar_producto(p_id IN NUMBER, p_nuevo_nombre IN VARCHAR2) AS
BEGIN
  UPDATE productos SET nombre = p_nuevo_nombre WHERE id = p_id;
END;
/

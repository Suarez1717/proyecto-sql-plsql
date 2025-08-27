CREATE OR REPLACE PROCEDURE prc_normalizar_nombres_productos AS
BEGIN
  UPDATE productos SET nombre = INITCAP(LOWER(nombre));
END;
/

CREATE OR REPLACE PROCEDURE prc_fix_precios_negativos AS
BEGIN
  UPDATE productos SET precio = 0 WHERE precio < 0;
END;
/

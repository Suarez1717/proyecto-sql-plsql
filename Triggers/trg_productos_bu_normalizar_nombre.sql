CREATE OR REPLACE TRIGGER trg_productos_bu_normalizar_nombre
BEFORE INSERT OR UPDATE OF nombre ON productos
FOR EACH ROW
BEGIN
  :NEW.nombre := INITCAP(LOWER(:NEW.nombre));
END;
/

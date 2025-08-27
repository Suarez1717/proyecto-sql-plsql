CREATE OR REPLACE TRIGGER trg_ventas_bu_precio_no_negativo
BEFORE INSERT OR UPDATE OF precio ON ventas
FOR EACH ROW
BEGIN
  IF :NEW.precio < 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'El precio no puede ser negativo');
  END IF;
END;
/

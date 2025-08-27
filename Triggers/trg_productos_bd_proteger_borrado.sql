CREATE OR REPLACE TRIGGER trg_productos_bd_proteger_borrado
BEFORE DELETE ON productos
FOR EACH ROW
DECLARE
  v_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_cnt FROM ventas WHERE id_producto = :OLD.id;
  IF v_cnt > 0 THEN
    RAISE_APPLICATION_ERROR(-20050, 'No se puede borrar: existen ventas asociadas');
  END IF;
END;
/

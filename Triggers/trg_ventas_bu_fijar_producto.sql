CREATE OR REPLACE TRIGGER trg_ventas_bu_fijar_producto
BEFORE UPDATE OF id_producto ON ventas
FOR EACH ROW
BEGIN
  IF :OLD.id_producto <> :NEW.id_producto THEN
    RAISE_APPLICATION_ERROR(-20003, 'No se permite modificar el producto de una venta');
  END IF;
END;
/

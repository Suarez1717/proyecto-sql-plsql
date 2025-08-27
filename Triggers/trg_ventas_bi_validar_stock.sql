CREATE OR REPLACE TRIGGER trg_ventas_bi_validar_stock
BEFORE INSERT OR UPDATE OF cantidad ON ventas
FOR EACH ROW
DECLARE
  v_stock NUMBER;
BEGIN
  SELECT stock INTO v_stock FROM productos WHERE id = :NEW.id_producto;
  IF v_stock < :NEW.cantidad THEN
    RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente para la venta');
  END IF;
END;
/

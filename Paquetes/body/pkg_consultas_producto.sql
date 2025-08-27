CREATE OR REPLACE PACKAGE BODY pkg_consultas_producto AS
  FUNCTION existe(p_nombre IN VARCHAR2) RETURN CHAR IS
  BEGIN RETURN fn_producto_existe(p_nombre); END;
  FUNCTION stock(p_id IN NUMBER) RETURN NUMBER IS
  BEGIN RETURN fn_stock_producto(p_id); END;
  FUNCTION precio(p_id IN NUMBER) RETURN NUMBER IS
  BEGIN RETURN fn_precio_producto(p_id); END;
  FUNCTION ultima_venta(p_id IN NUMBER) RETURN DATE IS
  BEGIN RETURN fn_ultima_venta_producto(p_id); END;
END pkg_consultas_producto;
/

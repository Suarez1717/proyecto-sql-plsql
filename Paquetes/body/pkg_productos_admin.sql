CREATE OR REPLACE PACKAGE BODY pkg_productos_admin AS
  PROCEDURE cambiar_precio(p_id IN NUMBER, p_precio IN NUMBER) IS
  BEGIN prc_actualizar_precio_producto(p_id, p_precio); END;
  PROCEDURE actualizar_stock(p_id IN NUMBER, p_stock IN NUMBER) IS
  BEGIN prc_actualizar_stock(p_id, p_stock); END;
  PROCEDURE reponer(p_id IN NUMBER, p_cantidad IN NUMBER) IS
  BEGIN prc_reponer_stock(p_id, p_cantidad); END;
  PROCEDURE reetiquetar(p_id IN NUMBER, p_nombre IN VARCHAR2) IS
  BEGIN prc_reetiquetar_producto(p_id, p_nombre); END;
  FUNCTION precio(p_id IN NUMBER) RETURN NUMBER IS
  BEGIN RETURN fn_precio_producto(p_id); END;
  FUNCTION stock(p_id IN NUMBER) RETURN NUMBER IS
  BEGIN RETURN fn_stock_producto(p_id); END;
END pkg_productos_admin;
/

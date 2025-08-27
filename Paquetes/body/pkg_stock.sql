CREATE OR REPLACE PACKAGE BODY pkg_stock AS
  PROCEDURE ajustar_por_venta(p_id IN NUMBER, p_cantidad IN NUMBER) IS
  BEGIN prc_ajustar_stock_por_venta(p_id, p_cantidad); END;
  PROCEDURE ajustar_por_devolucion(p_id IN NUMBER, p_cantidad IN NUMBER) IS
  BEGIN prc_ajustar_stock_por_devolucion(p_id, p_cantidad); END;
  PROCEDURE normalizar_nombres IS
  BEGIN prc_normalizar_nombres_productos; END;
END pkg_stock;
/

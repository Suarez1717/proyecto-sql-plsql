CREATE OR REPLACE PACKAGE pkg_stock AS
  PROCEDURE ajustar_por_venta(p_id IN NUMBER, p_cantidad IN NUMBER);
  PROCEDURE ajustar_por_devolucion(p_id IN NUMBER, p_cantidad IN NUMBER);
  PROCEDURE normalizar_nombres;
END pkg_stock;
/

CREATE OR REPLACE PACKAGE pkg_consultas_producto AS
  FUNCTION existe(p_nombre IN VARCHAR2) RETURN CHAR;
  FUNCTION stock(p_id IN NUMBER) RETURN NUMBER;
  FUNCTION precio(p_id IN NUMBER) RETURN NUMBER;
  FUNCTION ultima_venta(p_id IN NUMBER) RETURN DATE;
END pkg_consultas_producto;
/

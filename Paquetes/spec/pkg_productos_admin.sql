CREATE OR REPLACE PACKAGE pkg_productos_admin AS
  PROCEDURE cambiar_precio(p_id IN NUMBER, p_precio IN NUMBER);
  PROCEDURE actualizar_stock(p_id IN NUMBER, p_stock IN NUMBER);
  PROCEDURE reponer(p_id IN NUMBER, p_cantidad IN NUMBER);
  PROCEDURE reetiquetar(p_id IN NUMBER, p_nombre IN VARCHAR2);
  FUNCTION  precio(p_id IN NUMBER) RETURN NUMBER;
  FUNCTION  stock(p_id IN NUMBER) RETURN NUMBER;
END pkg_productos_admin;
/

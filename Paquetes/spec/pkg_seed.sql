CREATE OR REPLACE PACKAGE pkg_seed AS
  PROCEDURE datos_demo(p_n_productos IN NUMBER := 10, p_n_ventas IN NUMBER := 50);
END pkg_seed;
/

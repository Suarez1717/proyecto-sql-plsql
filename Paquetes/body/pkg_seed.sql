CREATE OR REPLACE PACKAGE BODY pkg_seed AS
  PROCEDURE datos_demo(p_n_productos IN NUMBER, p_n_ventas IN NUMBER) IS
  BEGIN prc_seed_datos_demo(p_n_productos, p_n_ventas); END;
END pkg_seed;
/

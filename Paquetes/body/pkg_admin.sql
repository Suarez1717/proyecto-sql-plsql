CREATE OR REPLACE PACKAGE BODY pkg_admin AS
  PROCEDURE reindexar IS
  BEGIN prc_reindexar_estadisticas; END;
  PROCEDURE fix_precios_negativos IS
  BEGIN prc_fix_precios_negativos; END;
END pkg_admin;
/

CREATE OR REPLACE PACKAGE pkg_admin AS
  PROCEDURE reindexar;
  PROCEDURE fix_precios_negativos;
END pkg_admin;
/

CREATE OR REPLACE PACKAGE pkg_purge AS
  PROCEDURE ventas(p_antig_dias IN NUMBER := 365);
END pkg_purge;
/

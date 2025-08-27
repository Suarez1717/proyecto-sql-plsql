CREATE OR REPLACE PACKAGE BODY pkg_purge AS
  PROCEDURE ventas(p_antig_dias IN NUMBER) IS
  BEGIN prc_purga_ventas_antiguas(p_antig_dias); END;
END pkg_purge;
/

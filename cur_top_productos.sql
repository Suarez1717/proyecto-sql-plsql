CREATE OR REPLACE PROCEDURE cur_top_productos(p_limit IN NUMBER, p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT * FROM (
      SELECT id_producto, SUM(cantidad) total_vendido
      FROM ventas GROUP BY id_producto ORDER BY total_vendido DESC
    ) WHERE ROWNUM <= NVL(p_limit, 10);
END;
/

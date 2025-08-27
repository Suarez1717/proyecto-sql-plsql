CREATE OR REPLACE PROCEDURE cur_ingresos_por_producto(p_rc OUT SYS_REFCURSOR) AS
BEGIN
  OPEN p_rc FOR
    SELECT p.id id_producto, p.nombre, NVL(SUM(v.cantidad*v.precio),0) ingresos
    FROM productos p LEFT JOIN ventas v ON v.id_producto = p.id
    GROUP BY p.id, p.nombre ORDER BY ingresos DESC;
END;
/

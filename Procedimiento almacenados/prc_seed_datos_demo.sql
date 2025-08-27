CREATE OR REPLACE PROCEDURE prc_seed_datos_demo(p_n_productos IN NUMBER := 10, p_n_ventas IN NUMBER := 50) AS
BEGIN
  FOR i IN 1..p_n_productos LOOP
    INSERT INTO productos(nombre, precio, stock) VALUES ('Producto '||i, 100+i, 10+i);
  END LOOP;
  FOR j IN 1..p_n_ventas LOOP
    INSERT INTO ventas(id_producto, cantidad, precio, fecha_venta)
    VALUES (MOD(j, p_n_productos)+1, 1+MOD(j,3), 100+MOD(j,10), SYSDATE - MOD(j,10));
  END LOOP;
END;
/

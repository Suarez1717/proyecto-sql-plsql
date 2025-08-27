CREATE DATABASE IF NOT EXISTS tienda
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;
USE tienda;
CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  precio DECIMAL(12,2) NOT NULL DEFAULT 0,
  stock INT NOT NULL DEFAULT 0
);
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  rol VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ventas_producto FOREIGN KEY (id_producto) REFERENCES productos(id)
);
CREATE OR REPLACE VIEW v_ventas_por_dia AS
SELECT DATE(fecha_venta) AS fecha,
       SUM(cantidad) AS total_ventas,
       SUM(cantidad*precio) AS ingresos
FROM ventas GROUP BY DATE(fecha_venta);
CREATE OR REPLACE VIEW v_valor_inventario AS
SELECT id, nombre, precio, stock, (precio*stock) AS valor_inventario FROM productos;
DROP TRIGGER IF EXISTS trg_ventas_bi_stock;
DELIMITER //
CREATE TRIGGER trg_ventas_bi_stock
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
  DECLARE v_stock INT;
  SELECT stock INTO v_stock FROM productos WHERE id = NEW.id_producto;
  IF v_stock IS NULL THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Producto inexistente'; END IF;
  IF v_stock < NEW.cantidad THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Stock insuficiente'; END IF;
END//
DELIMITER ;
DELIMITER //
DROP PROCEDURE IF EXISTS prc_insertar_producto//
CREATE PROCEDURE prc_insertar_producto(IN p_nombre VARCHAR(120), IN p_precio DECIMAL(12,2), IN p_stock INT)
BEGIN
  INSERT INTO productos(nombre, precio, stock) VALUES (p_nombre, p_precio, p_stock);
  SELECT LAST_INSERT_ID() AS id;
END//
DROP PROCEDURE IF EXISTS prc_actualizar_precio_producto//
CREATE PROCEDURE prc_actualizar_precio_producto(IN p_id INT, IN p_precio DECIMAL(12,2))
BEGIN
  IF p_precio < 0 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Precio no puede ser negativo'; END IF;
  UPDATE productos SET precio = p_precio WHERE id = p_id;
  SELECT ROW_COUNT() AS filas;
END//
DROP PROCEDURE IF EXISTS prc_actualizar_stock//
CREATE PROCEDURE prc_actualizar_stock(IN p_id INT, IN p_stock INT)
BEGIN
  UPDATE productos SET stock = p_stock WHERE id = p_id;
  SELECT ROW_COUNT() AS filas;
END//
DROP PROCEDURE IF EXISTS prc_eliminar_producto//
CREATE PROCEDURE prc_eliminar_producto(IN p_id INT)
BEGIN
  DELETE FROM productos WHERE id = p_id;
  SELECT ROW_COUNT() AS filas;
END//
DROP PROCEDURE IF EXISTS prc_insertar_venta//
CREATE PROCEDURE prc_insertar_venta(IN p_id_producto INT, IN p_cantidad INT, IN p_precio DECIMAL(12,2), IN p_fecha DATETIME)
BEGIN
  IF (SELECT stock FROM productos WHERE id = p_id_producto) < p_cantidad THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Stock insuficiente';
  END IF;
  INSERT INTO ventas(id_producto, cantidad, precio, fecha_venta)
  VALUES (p_id_producto, p_cantidad, p_precio, IFNULL(p_fecha, NOW()));
  UPDATE productos SET stock = stock - p_cantidad WHERE id = p_id_producto;
  SELECT LAST_INSERT_ID() AS id;
END//
DROP PROCEDURE IF EXISTS prc_listar_productos//
CREATE PROCEDURE prc_listar_productos()
BEGIN
  SELECT id, nombre, precio, stock FROM productos ORDER BY id;
END//
DROP PROCEDURE IF EXISTS prc_buscar_producto//
CREATE PROCEDURE prc_buscar_producto(IN p_texto VARCHAR(120))
BEGIN
  SELECT id, nombre, precio, stock FROM productos
  WHERE UPPER(nombre) LIKE CONCAT('%', UPPER(p_texto), '%') ORDER BY nombre;
END//
DROP PROCEDURE IF EXISTS prc_ventas_dia//
CREATE PROCEDURE prc_ventas_dia(IN p_fecha DATE)
BEGIN
  SELECT id, id_producto, cantidad, precio, fecha_venta
  FROM ventas WHERE DATE(fecha_venta) = DATE(p_fecha) ORDER BY fecha_venta;
END//
DELIMITER ;
INSERT INTO productos(nombre, precio, stock) VALUES
('Teclado Mecánico', 49.90, 25),
('Mouse Inalámbrico', 19.99, 40),
('Monitor 24"', 139.00, 12),
('SSD 1TB', 85.50, 18)
ON DUPLICATE KEY UPDATE nombre=VALUES(nombre);

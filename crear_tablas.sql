-- Crear tabla de productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR2(100),
    precio_unitario NUMBER(10,2),
    stock INT
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR2(100),
    rol VARCHAR2(50)
);

-- Procedimiento para calcular total de ventas por día
CREATE OR REPLACE PROCEDURE total_ventas_por_dia(p_fecha DATE) AS
    total NUMBER(10,2);
BEGIN
    SELECT SUM(p.precio_unitario * v.cantidad)
    INTO total
    FROM ventas v
    JOIN productos p ON v.id_producto = p.id_producto
    WHERE TRUNC(v.fecha) = TRUNC(p_fecha);

    DBMS_OUTPUT.PUT_LINE('Total de ventas para ' || TO_CHAR(p_fecha, 'DD-MM-YYYY') || ': ' || total);
END;
/

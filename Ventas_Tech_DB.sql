CREATE DATABASE Ventas_Tech_DB;
USE Ventas_Tech_DB;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo TINYINT DEFAULT 1
);
CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL
);
ALTER TABLE productos
ADD CONSTRAINT FK_productos_categorias
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria);
ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_clientes
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente);
ALTER TABLE ventas
ADD CONSTRAINT FK_ventas_productos
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto);
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion)
VALUES
(1, 'Computación', 'Equipos y accesorios de computación'),
(2, 'Celulares', 'Teléfonos y accesorios'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Accesorios', 'Accesorios tecnológicos');
INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
VALUES
(1, 'Ana Torres', 'ana.torres@email.com', 'Córdoba', '2025-01-15'),
(2, 'Luis Gómez', 'luis.gomez@email.com', 'Buenos Aires', '2025-02-10'),
(3, 'María López', 'maria.lopez@email.com', 'Rosario', '2025-03-05'),
(4, 'Carlos Díaz', 'carlos.diaz@email.com', 'Mendoza', '2025-03-20'),
(5, 'Sofía Pérez', 'sofia.perez@email.com', 'Córdoba', '2025-04-12');
INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(1, 'Laptop Pro', 1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico', 4, 25.50, 80, 1),
(3, 'Teclado Mecánico', 4, 75.00, 40, 1),
(4, 'Auriculares Bluetooth', 3, 60.00, 30, 1),
(5, 'Smartphone X', 2, 800.00, 20, 1),
(6, 'Webcam HD', 1, 45.00, 25, 1);
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)
VALUES
(1, 1, 1, 1, 1200.00, '2025-05-01'),
(2, 2, 2, 2, 25.50, '2025-05-03'),
(3, 3, 5, 1, 800.00, '2025-05-05'),
(4, 1, 4, 1, 60.00, '2025-05-07'),
(5, 4, 3, 2, 75.00, '2025-05-10'),
(6, 5, 6, 1, 45.00, '2025-05-12'),
(7, 2, 1, 1, 1200.00, '2025-05-15'),
(8, 3, 2, 3, 25.50, '2025-05-18'),
(9, 4, 5, 1, 800.00, '2025-05-20'),
(10, 5, 4, 2, 60.00, '2025-05-22');
SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
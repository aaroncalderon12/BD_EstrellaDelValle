CREATE DATABASE HotelEstrellaDelValle;
GO

USE HotelEstrellaDelValle;
GO

--Creacíon de tablas para HOTEL ESTRELLA DEL VALLE
CREATE TABLE Clientes (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(80),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE Habitaciones (
    IdHabitacion INT IDENTITY(1,1) PRIMARY KEY,
    Numero INT,
    Tipo VARCHAR(20),   
    PrecioPorNoche DECIMAL(10,2)
);

CREATE TABLE Reservaciones (
    IdReserva INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT,
    IdHabitacion INT,
    FechaEntrada DATE,
    FechaSalida DATE,
    CantidadNoches AS DATEDIFF(DAY, FechaEntrada, FechaSalida),
    MontoTotal DECIMAL(10,2),

    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
    FOREIGN KEY (IdHabitacion) REFERENCES Habitaciones(IdHabitacion)
);

CREATE TABLE Pagos (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdReserva INT,
    Monto DECIMAL(10,2),
    FechaPago DATE,
    MetodoPago VARCHAR(30),

    FOREIGN KEY (IdReserva) REFERENCES Reservaciones(IdReserva)
);


--- INSERTS PARA CLIENTES
INSERT INTO Clientes (Nombre, Apellidos, Telefono, Email) VALUES
('Carlos', 'Ramírez Solano', '8888-1111', 'carlos@gmail.com'),
('Andrea', 'Mora Jiménez', '8989-2222', 'andrea@gmail.com'),
('Luis', 'Gutiérrez Castro', '8787-3333', 'luis@hotmail.com'),
('María', 'Vargas Rojas', '8456-4444', 'maria@yahoo.com'),
('Pedro', 'Soto Marín', '7012-5555', 'pedro@gmail.com'),
('Daniela', 'Rosales Gómez', '7201-6666', 'daniela@gmail.com'),
('Esteban', 'Navarro Chaves', '8899-7777', 'esteban@hotmail.com'),
('Natalia', 'Badilla Rivera', '8877-8888', 'natalia@gmail.com'),
('Jorge', 'Córdoba Pineda', '8765-9999', 'jorge@hotmail.com'),
('Fernanda', 'Hernández Quesada', '8123-0000', 'fernanda@gmail.com');

---INSERTS PARA HABITACIONES
INSERT INTO Habitaciones (Numero, Tipo, PrecioPorNoche) VALUES
(101, 'Sencilla', 35000),
(102, 'Sencilla', 35000),
(201, 'Doble', 55000),
(202, 'Doble', 55000),
(301, 'Suite', 90000),
(302, 'Suite', 90000),
(103, 'Sencilla', 35000),
(203, 'Doble', 55000),
(303, 'Suite', 90000),
(304, 'Suite', 90000);

---INSERTS PARA RESERVACIONES
INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal) VALUES
(1, 1, '2025-01-05', '2025-01-07', 2 * 35000),
(2, 3, '2025-01-10', '2025-01-13', 3 * 55000),
(3, 5, '2025-01-15', '2025-01-18', 3 * 90000),
(4, 2, '2025-01-20', '2025-01-22', 2 * 35000),
(5, 4, '2025-01-25', '2025-01-28', 3 * 55000),
(6, 6, '2025-02-01', '2025-02-04', 3 * 90000),
(7, 7, '2025-02-05', '2025-02-06', 1 * 35000),
(8, 8, '2025-02-10', '2025-02-12', 2 * 55000),
(9, 9, '2025-02-15', '2025-02-17', 2 * 90000),
(10, 10, '2025-02-18', '2025-02-21', 3 * 90000),
(3, 1, '2025-02-22', '2025-02-24', 2 * 35000),
(5, 3, '2025-02-25', '2025-02-27', 2 * 55000),
(7, 5, '2025-03-01', '2025-03-04', 3 * 90000),
(9, 2, '2025-03-05', '2025-03-06', 1 * 35000),
(1, 4, '2025-03-07', '2025-03-09', 2 * 55000);

---INSERTS PARA PAGOS
INSERT INTO Pagos (IdReserva, Monto, FechaPago, MetodoPago) VALUES
(1, 70000, '2025-01-07', 'Tarjeta'),
(2, 165000, '2025-01-13', 'Efectivo'),
(3, 270000, '2025-01-18', 'Tarjeta'),
(4, 70000, '2025-01-22', 'Sinpe Móvil'),
(5, 165000, '2025-01-28', 'Tarjeta'),
(6, 270000, '2025-02-04', 'Sinpe Móvil'),
(7, 35000, '2025-02-06', 'Tarjeta'),
(8, 110000, '2025-02-12', 'Tarjeta'),
(9, 180000, '2025-02-17', 'Efectivo'),
(10, 270000, '2025-02-21', 'Tarjeta'),
(11, 70000, '2025-02-24', 'Sinpe Móvil'),
(12, 110000, '2025-02-27', 'Tarjeta'),
(13, 270000, '2025-03-04', 'Efectivo'),
(14, 35000, '2025-03-06', 'Sinpe Móvil'),
(15, 110000, '2025-03-09', 'Tarjeta');



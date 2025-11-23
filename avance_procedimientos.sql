/* Procedimientos almacenados */

CREATE PROCEDURE sp_registrarReserva
    @IdCliente INT,
    @IdHabitacion INT,
    @FechaEntrada DATE,
    @FechaSalida DATE
AS
BEGIN
    DECLARE @Precio DECIMAL(10,2),
            @Noches INT,
            @Total DECIMAL(10,2);

    SELECT @Precio = PrecioPorNoche
    FROM Habitaciones
    WHERE IdHabitacion = @IdHabitacion;

    SET @Noches = DATEDIFF(DAY, @FechaEntrada, @FechaSalida);
    SET @Total = @Precio * @Noches;

    INSERT INTO Reservaciones (IdCliente, IdHabitacion, FechaEntrada, FechaSalida, MontoTotal)
    VALUES (@IdCliente, @IdHabitacion, @FechaEntrada, @FechaSalida, @Total);
END;



-----------------------------------------------------------



CREATE PROCEDURE sp_actualizardatosCliente
    @IdCliente INT,
    @Nombre VARCHAR(50),
    @Apellidos VARCHAR(80),
    @Telefono VARCHAR(20),
    @Email VARCHAR(100)
AS
BEGIN
    UPDATE Clientes
    SET Nombre = @Nombre,
        Apellidos = @Apellidos,
        Telefono = @Telefono,
        Email = @Email
    WHERE IdCliente = @IdCliente;
END;


----------------------------------------------------------------


CREATE PROCEDURE sp_ingresospormes
    @Ano INT
AS
BEGIN
    SELECT 
        MONTH(FechaPago) AS Mes,
        SUM(Monto) AS TotalIngresos
    FROM Pagos
    WHERE YEAR(FechaPago) = @Ano
    GROUP BY MONTH(FechaPago)
    ORDER BY Mes;
END;

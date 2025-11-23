
/* vistas */


CREATE VIEW vw_reservasDetalle AS
SELECT 
    r.IdReserva,
    c.Nombre + ' ' + c.Apellidos AS Cliente,
    h.Numero AS Habitacion,
    h.Tipo,
    r.FechaEntrada,
    r.FechaSalida,
    r.CantidadNoches,
    r.MontoTotal
FROM Reservaciones r
JOIN Clientes c ON r.IdCliente = c.IdCliente
JOIN Habitaciones h ON r.IdHabitacion = h.IdHabitacion;


------------------------


CREATE VIEW vw_pagosPorCliente AS
SELECT 
    c.IdCliente,
    c.Nombre + ' ' + c.Apellidos AS Cliente,
    SUM(p.Monto) AS TotalPagado
FROM Pagos p
JOIN Reservaciones r ON p.IdReserva = r.IdReserva
JOIN Clientes c ON r.IdCliente = c.IdCliente
GROUP BY c.IdCliente, c.Nombre, c.Apellidos;



-------------------

CREATE VIEW vw_ingresosHabitaciones AS
SELECT
    h.Numero,
    h.Tipo,
    SUM(r.MontoTotal) AS TotalGenerado
FROM Habitaciones h
JOIN Reservaciones r ON h.IdHabitacion = r.IdHabitacion
GROUP BY h.Numero, h.Tipo;
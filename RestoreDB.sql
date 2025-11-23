RESTORE DATABASE HotelEstrellaDelValle
FROM DISK = 'C:\Backups\HotelEstrellaDelValle.bak'
WITH REPLACE,
     MOVE 'HotelEstrellaDelValle' TO 'C:\SQLData\HotelEstrellaDelValle.mdf',
     MOVE 'HotelEstrellaDelValle_log' TO 'C:\SQLData\HotelEstrellaDelValle_log.ldf';



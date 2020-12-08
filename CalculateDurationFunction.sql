CREATE OR ALTER function CalculateDuration (@departureTime AS TIME, @arrivalTime AS TIME)
RETURNS time
AS 
BEGIN
DECLARE @duration time = convert(time,(convert(datetime, @arrivalTime) - convert(datetime, @departureTime)))
RETURN @duration
END;

ALTER TABLE flight ADD duration TIME;

UPDATE flight
SET duration = dbo.CalculateDuration(departure_time, arrival_time)
FROM flight;
GO
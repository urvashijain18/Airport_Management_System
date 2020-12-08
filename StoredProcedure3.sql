--flight from a particular source.. output as count of flight from that source
CREATE OR ALTER PROCEDURE NUM_OF_FLIGHTS (@flightCount varchar(10) OUTPUT, @source varchar(15))
AS 
BEGIN
SET @flightCount = (SELECT COUNT(f.flight_source) FROM flight f WHERE f.flight_source = @source GROUP BY f.flight_source)
SELECT @source AS SOURCE, @flightCount AS 'Flight Count'
END;

DECLARE @flightCount varchar(10); 
EXEC NUM_OF_FLIGHTS @flightCount OUTPUT, @source='BOSTON';
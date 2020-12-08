--Number of flights under particular status for each airline
CREATE OR ALTER PROCEDURE FLIGHT_STATUS_COUNT (@count int OUTPUT, @status varchar(15), @airline varchar(3))
AS 
BEGIN
SET @count = (SELECT COUNT(s.flight_code) FROM flight f, schedule s 
WHERE flight_status = @status and f.airline_id = @airline and f.flight_code = s.flight_code);
SELECT @airline AS AIRLINE_ID, @status AS FLIGHT_STATUS, @count AS FLIGHT_STATUS_COUNT_PER_AIRLINE
END;

DECLARE @count int;
EXEC FLIGHT_STATUS_COUNT @count OUTPUT, @status = 'On-Time', @airline='100';
EXEC FLIGHT_STATUS_COUNT @count OUTPUT, @status = 'Delayed', @airline='100';
EXEC FLIGHT_STATUS_COUNT @count OUTPUT, @status = 'Cancelled', @airline='100';
--Passengers travelling in Particular class from particular source
CREATE OR ALTER PROCEDURE ECONOMY_PASSENGERS_LIST_BY_SOURCE (@count int OUTPUT, @source varchar(20), @class VARCHAR (20))
AS 
BEGIN
SELECT (p.first_name + ' ' + p.middle_name + ' ' + p.last_name) as Passenger_Name,
t.class, f.flight_source, f.flight_destination, t.seat_number, t.ticket_number
FROM ticket t, passenger p, schedule s, flight f
WHERE f.flight_source= @source AND t.class = @class AND t.passenger_id = p.passenger_id and t.schedule_id = s.schedule_id and
s.flight_code = f.flight_code
SELECT @count = @@ROWCOUNT 
SELECT @count AS NUM_OF_ECONOMY_PASSENGERS_BY_SOURCE
END;

DECLARE @count int;
EXEC ECONOMY_PASSENGERS_LIST_BY_SOURCE @count OUTPUT, @source='DALLAS', @class='ECONOMY';
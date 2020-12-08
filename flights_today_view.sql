ALTER VIEW flights_today
AS
SELECT s.flight_code,a.airline_name,f.flight_source,f.flight_destination,f.departure_time,f.arrival_time, s.flight_date
From schedule s
INNER JOIN flight f ON f.flight_code = s.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
WHERE s.flight_date = (SELECT CAST(GETDATE() AS DATE));

SELECT * FROM flights_today;

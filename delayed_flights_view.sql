create view flights_delayed AS
SELECT sc.flight_status, flight_source, flight_destination, airline_name
FROM schedule sc 
INNER JOIN flight f ON sc.flight_code = f.flight_code
INNER JOIN airline a ON f.airline_id = a.airline_id
where sc.flight_status = 'Delayed';

select * from flights_delayed;
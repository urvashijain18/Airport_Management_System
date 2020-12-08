create view nonstop_flights AS
SELECT flight_status, flight_type, flight_date, duration, flight_Source, flight_destination, departure_time, arrival_time, first_name, last_name, airline_name
FROM ticket t 
INNER JOIN schedule sc ON sc.schedule_id = t.schedule_id
INNER JOIN flight f ON f.flight_code = sc.flight_code
INNER JOIN passenger p ON p.passenger_id = t.passenger_id
INNER JOIN airline a ON a.airline_id = f.airline_id
where t.layovers = 0 ;

select * from nonstop_flights;
create view TotalBookingAccToLocation
AS
select f.flight_source , count(f.flight_source) as count
from flight f, ticket t, schedule s
where t.schedule_id = s.schedule_id and s.flight_code = f.flight_code
group by f.flight_source;

Select * from TotalBookingAccToLocation;
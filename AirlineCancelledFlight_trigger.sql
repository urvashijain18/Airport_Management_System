create or Alter TRIGGER airlineCancelledFlight
ON schedule
AFTER UPDATE
AS
BEGIN
DECLARE @statusdelayed_val varchar(15) = 'Delayed'
DECLARE @statusontime_val varchar(15) = 'On-Time'
DECLARE @status_updated varchar(15)
SELECT @status_updated = ins.flight_status from inserted ins;
IF @status_updated = @statusdelayed_val
UPDATE dbo.ticket SET flag = 'F'
	ELSE IF @status_updated = @statusontime_val
UPDATE dbo.ticket SET flag = 'F'
ELSE
UPDATE dbo.ticket SET flag = 'T'
END;

UPDATE schedule set flight_status = 'Cancelled' where schedule_id=12;
select * from ticket;
select * from cancellation;
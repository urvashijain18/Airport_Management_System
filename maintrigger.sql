create or alter function calculatesurcharge (@input AS INT)
RETURNS INT
AS
BEGIN
DECLARE @functionprice int = (Select price from ticket where ticket_number = @input);
DECLARE @deducted int = (25*@functionprice)/100;
DECLARE @surcharge int = @functionprice - @deducted;

RETURN @surcharge
END;

create or Alter TRIGGER CancelledTickets
ON ticket
AFTER UPDATE
AS
BEGIN
DECLARE @ticket_number int
DECLARE @surcharge int
DECLARE @flag_val varchar(1) = 'T'
DECLARE @flagVal_updated varchar(1)
DECLARE @cancellationdate Date = GetDate()
SELECT @ticket_number = ins.ticket_number from inserted ins;
SELECT @surcharge = dbo.calculatesurcharge(@ticket_number);
SELECT @flagVal_updated = ins.flag from inserted ins;
IF @flagVal_updated = @flag_val
    INSERT INTO [dbo].[cancellation] values
    (@ticket_number,@cancellationdate,@surcharge);
   
END;

update ticket SET flag = 'T' where ticket_number = 1000000003;

select * from cancellation;
create or alter function calculatesurcharge (@input AS INT)
RETURNS INT
AS
BEGIN
DECLARE @functionprice int = (Select price from ticket where ticket_number = @input);
DECLARE @deducted int = (25*@functionprice)/100;
DECLARE @surcharge int = @functionprice - @deducted;

RETURN @surcharge
END;

USE Airport_Management_System
GO

SELECT dbo.calculatesurcharge(1000000001);

GO
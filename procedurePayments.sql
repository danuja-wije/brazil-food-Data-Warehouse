CREATE PROCEDURE dbo.UpdateDimPayment
@payment_id int,
@payment_method nvarchar(50),
@payment_status nvarchar(50),
@payment_fee money

AS BEGIN
if not exists (select Payment_SK 
from dbo.DimPayments
where Payment_ID = @payment_id) BEGIN
insert into dbo.DimPayments
(Payment_ID,Payment_Method,Payment_Status,Payment_Fee,ModifiedDate,InsertDate)
values
(@payment_id,@payment_method,@payment_status,@payment_fee,GETDATE(),GETDATE()) END;
if exists (select Payment_SK
from dbo.DimPayments
where Payment_ID = @payment_id) BEGIN
update dbo.DimPayments
set Payment_Method = @payment_method,Payment_Status=@payment_status,Payment_Fee=@payment_fee,ModifiedDate = GETDATE()
where Payment_ID = @payment_id END;
END;
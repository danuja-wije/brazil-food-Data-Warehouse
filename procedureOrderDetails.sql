CREATE PROCEDURE dbo.UpdateDimOrderDetail
@order_id int,
@order_status nvarchar(50)

AS BEGIN
if not exists (select Order_Detail_SK 
from dbo.DimOrderDetails
where Order_ID = @order_id) BEGIN
insert into dbo.DimOrderDetails
(Order_ID,Order_Status,ModifiedDate,InsertDate)
values
(@order_id,@order_status,GETDATE(),GETDATE()) END;
if exists (select Order_Detail_SK
from dbo.DimOrderDetails
where Order_ID = @order_id) BEGIN
update dbo.DimOrderDetails
set Order_Status = @order_status,ModifiedDate = GETDATE()
where Order_ID = @order_id END;
END;
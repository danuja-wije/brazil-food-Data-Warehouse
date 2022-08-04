CREATE PROCEDURE dbo.UpdateDimDelivery
@delivery_ID int,
@driver_Key int,
@delivery_distance_meters int,
@delivery_type nvarchar(50)
AS
BEGIN
if not exists (select Delivery_SK
from dbo.DimDeliveries
where Delivery_ID = @delivery_ID)
BEGIN
insert into dbo.DimDeliveries
(Delivery_ID, Driver_key, Delivery_distance_meters, Delivery_type,
Insert_date, Modified_date)
values
(@delivery_ID, @driver_Key, @delivery_distance_meters, @delivery_type,
GETDATE(), GETDATE())
END;
if exists (select Delivery_SK
from dbo.DimDeliveries
where Delivery_ID = @delivery_ID)
BEGIN
update dbo.DimDeliveries
set Driver_key = @driver_Key,
Delivery_distance_meters = @delivery_distance_meters,
Delivery_type = @delivery_type,
Modified_date = GETDATE()
where Delivery_ID = @delivery_ID
END;
END;
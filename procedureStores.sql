CREATE PROCEDURE dbo.UpdateDimStore
@store_id int,
@hub_key int,
@store_name nvarchar(50),
@store_type nvarchar(50),
@store_segment nvarchar(50),
@store_plan_price money

AS BEGIN
if not exists (select Store_SK
from dbo.DimStores
where Store_ID =@store_id) BEGIN
insert into dbo.DimStores
(Store_ID,Store_name,Store_type,Hub_key,Store_segment,Store_plan_price,Insert_date,Modified_date)
values
(@store_id,@store_name,@store_type,@hub_key,@store_segment,@store_plan_price,GETDATE(),GETDATE()) END;
if exists (select Store_SK
from dbo.DimStores
where Store_ID = @store_id) BEGIN
update dbo.DimStores
set Store_name = @store_name,Store_type=@store_type,Hub_key=@hub_key,Store_segment=@store_segment,Store_plan_price=@store_plan_price,Modified_date = GETDATE()
where Store_ID = @store_id END;
END;
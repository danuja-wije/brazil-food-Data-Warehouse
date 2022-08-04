CREATE PROCEDURE dbo.UpdateDimDriver
@driver_id int,
@driver_name nvarchar(100),
@driver_email nvarchar(100),
@driver_phone nvarchar(50),
@driver_model nvarchar(50),
@driver_type nvarchar(50)

AS BEGIN
if not exists (select Driver_SK 
from dbo.DimDrivers
where Driver_ID = @driver_id) BEGIN
insert into dbo.DimDrivers
(Driver_ID,Driver_name,Driver_email,Driver_phone,Driver_modal,Driver_type,Modified_date,Insert_date)
values
(@driver_id,@driver_name,@driver_email,@driver_phone,@driver_model,@driver_type,GETDATE(),GETDATE()) END;
if exists (select Driver_SK
from dbo.DimDrivers
where Driver_ID = @driver_id) BEGIN
update dbo.DimDrivers
set Driver_name = @driver_name,Driver_email=@driver_email,Driver_phone=@driver_phone,Driver_modal=@driver_model,Driver_type=@driver_type,Modified_date = GETDATE()
where Driver_ID = Driver_ID END;
END;
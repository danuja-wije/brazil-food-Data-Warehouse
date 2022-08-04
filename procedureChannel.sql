CREATE PROCEDURE dbo.UpdateDimChannel
@channel_id int,
@channel_name nvarchar(50),
@channel_type nvarchar(50)

AS BEGIN
if not exists (select Channel_SK 
from dbo.DimChannel
where Channel_ID = @channel_id) BEGIN
insert into dbo.DimChannel
(Channel_ID,Channel_Name,Channel_Type,Modified_date,Insert_date)
values
(@channel_id,@channel_name,@channel_type,GETDATE(),GETDATE()) END;
if exists (select Channel_SK
from dbo.DimChannel
where Channel_ID = @channel_id) BEGIN
update dbo.DimChannel
set Channel_Name = @channel_name,Channel_Type = @channel_type,Modified_date = GETDATE()
where Channel_ID = @channel_id END;
END;
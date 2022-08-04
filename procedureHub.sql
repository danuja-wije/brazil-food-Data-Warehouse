CREATE PROCEDURE dbo.UpdateDimHub
@hub_id int,
@hub_name nvarchar(50),
@hub_state nvarchar(50)


AS BEGIN
if not exists (select Hub_SK
from dbo.DimHubs
where Hub_ID =@hub_id) BEGIN
insert into dbo.DimHubs
(Hub_ID,Hub_name,Hub_state,InsertDate,ModifiedDate)
values
(@hub_id,@hub_name,@hub_state,GETDATE(),GETDATE()) END;
if exists (select Hub_SK
from dbo.DimHubs
where Hub_ID = @hub_id) BEGIN
update dbo.DimHubs
set Hub_name = @hub_name,Hub_state=@hub_state,ModifiedDate = GETDATE()
where Hub_ID = @hub_id END;
END;
CREATE PROCEDURE dbo.UpdateDimSubCity
@state_id int,
@state_name nvarchar(50)

AS BEGIN
if not exists (select SubCity_SK
from dbo.DimSubCity
where State_ID =@state_id) BEGIN
insert into dbo.DimSubCity
(State_ID,State_name,Insert_date,Modified_date)
values
(@state_id,@state_name,GETDATE(),GETDATE()) END;
if exists (select SubCity_SK
from dbo.DimSubCity
where State_ID = @state_id) BEGIN
update dbo.DimSubCity
set @state_name = @state_name,Modified_date = GETDATE()
where State_ID = @state_id END;
END;
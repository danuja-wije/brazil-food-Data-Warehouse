DROP TABLE DimHubs
CREATE TABLE DimHubs(
	Hub_SK int identity(1,1) primary key,
	Hub_ID int,
	Hub_name nvarchar(50),
	Hub_state nvarchar(50),
	Hub_city nvarchar(50),
	InsertDate	DateTime,
	ModifiedDate DateTime
)
DROP TABLE DimChannel
CREATE TABLE DimChannel(
	Channel_SK int identity(1,1) primary key,
	Channel_ID int,
	Channel_Name nvarchar(50),
	Channel_Type nvarchar(50),
	InsertDate	DateTime,
	ModifiedDate DateTime
)
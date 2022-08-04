CREATE TABLE DimOrderDetails(
	Order_Detail_SK int identity(1,1) primary key,
	Order_Status nvarchar(50),
	InsertDate	DateTime,
	ModifiedDate DateTime
)
CREATE TABLE DimPayments(
	Payment_SK int identity(1,1) primary key,
	Payment_ID int,
	Payment_Method nvarchar(50),
	Payment_Status nvarchar(50),
	InsertDate	DateTime,
	ModifiedDate DateTime
)
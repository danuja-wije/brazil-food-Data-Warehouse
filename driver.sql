DROP TABLE DimDrivers

CREATE TABLE DimDrivers(
	Driver_SK int identity(1,1) primary key,
	Driver_ID int,
	Driver_name nvarchar(100),
	Driver_email nvarchar(100),
	Driver_phone nvarchar(50),
	Driver_modal nvarchar(50),
	Driver_type nvarchar(50),
	Insert_date	DateTime,
	Modified_date DateTime
)
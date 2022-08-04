DROP TABLE DimDeliveries
CREATE TABLE DimDeliveries(
	Delivery_SK int identity(1,1) primary key,
	Driver_key int foreign key references DimDrivers(Driver_SK),
	Delivery_ID int,
	Delivery_distance_meters int,
	Delivery_type nvarchar(50),
	Insert_date	DateTime,
	Modified_date DateTime
)
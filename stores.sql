DROP TABLE DimStores
CREATE TABLE DimStores(
	Store_SK int identity(1,1) primary key,
	Store_ID int,
	Hub_key int foreign key references DimHubs(Hub_SK),
	Store_name nvarchar(50),
	Store_type nvarchar(50),
	Store_segment nvarchar(50),
	Store_plan_price money,
	Insert_date	DateTime,
	Modified_date DateTime
)
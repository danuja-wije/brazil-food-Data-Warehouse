DROP TABLE DimSubSubCity
CREATE TABLE DimSubCity(
	SubSubCity_SK int identity(1,1) primary key,
	State_ID int foreign key references DimHubs(Hub_SK),
	Citye_name nvarchar(50),
	Insert_date	DateTime,
	Modified_date DateTime
)
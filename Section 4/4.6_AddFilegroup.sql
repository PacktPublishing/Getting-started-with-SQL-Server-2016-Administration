ALTER DATABASE PacktPub ADD FILEGROUP PacktPub_mo CONTAINS MEMORY_OPTIMIZED_DATA;
GO

ALTER DATABASE PacktPub
ADD FILE
(
    NAME = 'PacktPub_mo_file',
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PacktPub_mo'
)
TO FILEGROUP PacktPub_mo;
GO


ALTER DATABASE PacktPub SET DELAYED_DURABILITY = 








USE PacktPub
GO
-- Create a table
CREATE TABLE Order_MO
( OrderID INT PRIMARY KEY NONCLUSTERED
, OrderDate DATETIME2
, Qty SMALLINT
, UnitPrice NUMERIC(12, 4)
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO
-- error
CREATE TABLE Customer_MO
( CustomerID INT PRIMARY KEY CLUSTERED
, CustomerName VARCHAR(100)
, active bit
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO


-- recreate with two indexes
CREATE TABLE Customer_MO
( CustomerID INT PRIMARY KEY NONCLUSTERED
, CustomerName VARCHAR(100)
, active BIT
INDEX Customer_IX NONCLUSTERED HASH (CustomerName) WITH (BUCKET_COUNT = 555)
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_AND_DATA)
GO




-- create indexes
ALTER TABLE dbo.Order_MO
 ADD ProductID INT,
 INDEX ORDER_IX1 NONCLUSTERED (ProductID)
GO
ALTER TABLE Customer_MO
 ALTER INDEX Customer_IX REBUILD WITH (BUCKET_COUNT = 601)
GO

-- check table properties
-- check memory report


-- add data
INSERT dbo.Customer_MO
        ( CustomerID, CustomerName, active )
    VALUES ( 1, 'Acme', 1)
	     , ( 2, 'Roadrunner, Inc', 1)
	     , ( 3, 'Coyote Enterprises', 1)
	     , ( 4, 'Falling Rock Partnership', 1)
GO

-- check memory report
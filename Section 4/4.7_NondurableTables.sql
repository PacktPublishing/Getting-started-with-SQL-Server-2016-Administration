-- Non-durable tables
CREATE TABLE Cart_MO
( UserID INT PRIMARY KEY NONCLUSTERED
 , sessionid UNIQUEIDENTIFIER
, OrderDate DATETIME2
, Qty SMALLINT
, UnitPrice NUMERIC(12, 4)
)
WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY)
GO

-- INSERT data
INSERT dbo.Cart_MO
        ( UserID, sessionid, OrderDate, Qty, UnitPrice)
    VALUES
        ( 243, NEWID(), SYSDATETIME(), 1, 50)

-- create indexes
ALTER TABLE dbo.Cart_MO
 ADD ProductID INT,
 INDEX ORDER_IX1 NONCLUSTERED (ProductID)
GO




-- update a row
UPDATE dbo.Cart_MO
 SET ProductID = 45
 WHERE UserID = 243
GO




-- check data
SELECT top 10
 *
 FROM dbo.Cart_MO


-- restart

-- Natively compiled stored procedures
-- normal procedure
CREATE PROCEDURE GetOrders_MO
   @orderid int
AS
BEGIN
    SELECT OrderID
         , OrderDate
         , Qty
         , UnitPrice
         , ProductID
	 FROM dbo.Order_MO
END
GO
-- create native
CREATE PROCEDURE GetOrders_MO_native
   @orderid INT
   WITH NATIVE_COMPILATION, SCHEMABINDING
AS
BEGIN ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = N'English')
    SELECT OrderID
         , OrderDate
         , Qty
         , UnitPrice
         , ProductID
	 FROM dbo.Order_MO
END
GO






-- Memory Optimized Table Variables
CREATE TYPE Cart_Type
AS TABLE (
UserID INT PRIMARY KEY NONCLUSTERED
 , sessionid UNIQUEIDENTIFIER
, OrderDate DATETIME2
, Qty SMALLINT
, UnitPrice NUMERIC(12, 4)
, ProductID INT,
INDEX Cart_Type_IX NONCLUSTERED HASH (UserID, sessionid) WITH (BUCKET_COUNT = 500)
) WITH (MEMORY_OPTIMIZED = ON)
GO
DECLARE @tempcart Cart_Type;
INSERT @tempcart
        ( UserID, sessionid, OrderDate, Qty, UnitPrice, ProductID)
    VALUES
        ( 5, NEWID(), SYSDATETIME(), 10, 9.99, 34),
        ( 7, NEWID(), SYSDATETIME(), 5, 6.50, 84)
SELECT * FROM @tempcart
GO

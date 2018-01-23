-- Clustered Columnstore Index

-- First, let's create a new table
CREATE TABLE SalesCommissions
(SalescommissionID INT
, SalesOrderID INT
, SalesDate DATETIME2
, Salestotal MONEY,
INDEX SalesCommissions_CCI CLUSTERED COLUMNSTORE)
GO







-- drop the table
DROP TABLE SalesCommissions;
GO












-- rebuild the table
CREATE TABLE SalesCommissions
(SalescommissionID INT 
, SalesOrderID INT
, SalesDate DATETIME2
, Salestotal MONEY
)
GO
CREATE CLUSTERED INDEX SalesCommissions_IDX ON dbo.SalesCommissions (SalescommissionID);
GO
-- convert to columnstore
CREATE CLUSTERED COLUMNSTORE INDEX SalesCommissions_IDX ON dbo.SalesCommissions
 WITH (DROP_EXISTING = ON, MAXDOP = 4)
GO







 












 


-- Maintenance
ALTER INDEX SalesCommissions_CCI ON dbo.SalesCommissions REORGANIZE;

ALTER INDEX SalesCommissions_CCI ON dbo.SalesCommissions REBUILD;









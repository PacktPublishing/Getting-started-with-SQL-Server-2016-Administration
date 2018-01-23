-- Create a sample data table
CREATE TABLE MyRandomData
(myid INT IDENTITY(1,1)
, MyDate DATETIME2
, myindexchar CHAR(1)
, mychar VARCHAR(20)
)
GO
-- insert sample data
WITH myNumbers(n)
AS
(
SELECT 
        n = ABS(CHECKSUM(NEWID())) % 2000
   FROM sys.all_columns ac1
  CROSS JOIN sys.all_columns ac2
)
INSERT dbo.MyRandomData ( MyDate, myindexchar, mychar )
SELECT TOP 1000
		TheDate = DATEADD(dd,n-1,GETDATE()),
		CHAR( 65 + (n % 26)),
		REPLICATE(CHAR( 65 + (n % 26)), 20)
   FROM myNumbers
;
GO

-- Turn on Actual Execution plan
SELECT myid, MyDate FROM dbo.MyRandomData WHERE myindexchar = 'A';
GO
-- create an index
CREATE INDEX MyRandomData_IDX_IndexChar ON dbo.MyRandomData(myindexchar) INCLUDE (myid, MyDate)
GO
-- rerun the query.
SELECT myid, MyDate FROM dbo.MyRandomData WHERE myindexchar = 'B';
GO

/*
Cleanup

DROP INDEX MyRandomData_IDX_IndexChar ON dbo.MyRandomData;
TRUNCATE TABLE MyRandomData;
*/
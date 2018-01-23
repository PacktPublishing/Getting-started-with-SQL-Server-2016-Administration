-- v5.2 - Clustered index

-- Create a sample table
CREATE TABLE OrderList(
  OrderID INT PRIMARY KEY 
, CustomerName VARCHAR(20)
);
GO
-- By default this is a clustered index.

















-- We should do this
CREATE TABLE OrderList2(
  OrderID INT PRIMARY KEY CLUSTERED
, CustomerName VARCHAR(20)
);
GO


















-- If we don't want the clustered index to be here, we might choose
CREATE TABLE OrderLists(
  OrderID INT PRIMARY KEY NONCLUSTERED
, CustomerName VARCHAR(20)
, OrderDate DATETIME2(7) 
);
GO
CREATE CLUSTERED INDEX OrderLists_CLX ON OrderLists(OrderDate);
GO
























-- We don't want this
CREATE TABLE OrderHeaderList(
  OrderID INT PRIMARY KEY NONCLUSTERED
, CustomerName VARCHAR(20)
, OrderDate DATETIME2(7) 
, OrderTotal MONEY
, Active BIT
, CloseDate DATETIME2(7)
);
GO
CREATE CLUSTERED INDEX OrderLists_CLX ON OrderHeaderList(OrderDate, OrderID, CustomerName, Active);
GO














-- nonclustered columnstore indexes
SELECT top 10
 SalesOrderID
, SalesOrderDetailID
, CarrierTrackingNumber
, OrderQty
, ProductID
, SpecialOfferID
, UnitPrice
, UnitPriceDiscount
, LineTotal
, rowguid
, ModifiedDate
 FROM Sales.SalesOrderDetail
GO

CREATE NONCLUSTERED COLUMNSTORE INDEX SalesDetail_ncc ON Sales.SalesOrderDetail 
 (SalesOrderID, 
  CarrierTrackingNumber,
  ProductID,
  OrderQty,
  UnitPrice,
  SpecialOfferID,
  UnitPriceDiscount
  )
GO











-- maintenance
ALTER INDEX SalesDetail_ncc ON Sales.SalesOrderDetail REORGANIZE
ALTER INDEX SalesDetail_ncc ON Sales.SalesOrderDetail REBUILD

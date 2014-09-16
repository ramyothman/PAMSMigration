CREATE VIEW [dbo].[vw_PurchaseOrderItem]
AS
SELECT     dbo.PurchaseOrderItem.PurchaseOrderItemID, dbo.PurchaseOrderItem.PurchaseOrderID, dbo.PurchaseOrderItem.ItemOrder, dbo.PurchaseOrderItem.ItemID, 
                      dbo.Product.Name AS ItemName, dbo.Category.Name AS CategoryName, Category_1.Name AS CategoryParentName, dbo.Product.ProductTypeID, 
                      dbo.ProductTypes.ProductType, dbo.PurchaseOrderItem.UnitPrice, dbo.PurchaseOrderItem.Quantity, dbo.PurchaseOrderItem.RateToEuro, 
                      dbo.PurchaseOrderItem.UnitPriceInEuro, dbo.PurchaseOrderItem.TotalPrice, dbo.PurchaseOrderItem.TotalPriceInEuro, dbo.PurchaseOrderItem.RecievedQuantity, 
                      dbo.PurchaseOrderItem.IsRecieved, dbo.PurchaseOrderItem.ItemDescription
FROM         dbo.PurchaseOrderItem INNER JOIN
                      dbo.Product ON dbo.PurchaseOrderItem.ItemID = dbo.Product.ProductID INNER JOIN
                      dbo.Category ON dbo.Product.CategoryID = dbo.Category.CategoryID INNER JOIN
                      dbo.Category AS Category_1 ON dbo.Category.Category2ID = Category_1.CategoryID INNER JOIN
                      dbo.ProductTypes ON dbo.Product.ProductTypeID = dbo.ProductTypes.ProductTypeID

CREATE VIEW [dbo].[GetAllPurchaseOrderItem]
AS
SELECT     PurchaseOrderItemID, PurchaseOrderID, ItemOrder, ItemID, UnitPrice, Quantity, RateToEuro, UnitPriceInEuro, TotalPrice, TotalPriceInEuro, RecievedQuantity, 
                      IsRecieved, ItemDescription
FROM         dbo.PurchaseOrderItem

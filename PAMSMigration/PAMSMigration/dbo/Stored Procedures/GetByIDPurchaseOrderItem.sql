CREATE PROCEDURE [dbo].[GetByIDPurchaseOrderItem]
    @PurchaseOrderItemID int
AS
BEGIN
Select ItemID, ItemOrder, PurchaseOrderID, PurchaseOrderItemID, Quantity, RateToEuro, RecievedQuantity, TotalPrice, TotalPriceInEuro, UnitPrice, UnitPriceInEuro
From [dbo].[PurchaseOrderItem]
WHERE [PurchaseOrderItemID] = @PurchaseOrderItemID
END

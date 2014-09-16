CREATE PROCEDURE [dbo].[GetByIDPurchaseOrder]
    @PurchaseOrderID int
AS
BEGIN
Select *
From [dbo].[PurchaseOrder]
WHERE [PurchaseOrderID] = @PurchaseOrderID
END

CREATE PROCEDURE [dbo].[DeletePurchaseOrderItem]
    @PurchaseOrderItemID int
AS
Begin
 Delete [dbo].[PurchaseOrderItem] where     [PurchaseOrderItemID] = @PurchaseOrderItemID
End

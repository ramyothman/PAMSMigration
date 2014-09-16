CREATE PROCEDURE [dbo].[DeletePurchaseOrder]
    @PurchaseOrderID int
AS
Begin
 Delete [dbo].[PurchaseOrder] where     [PurchaseOrderID] = @PurchaseOrderID
End

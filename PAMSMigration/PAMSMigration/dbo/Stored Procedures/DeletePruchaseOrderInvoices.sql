Create PROCEDURE [dbo].[DeletePruchaseOrderInvoices]
    @PurchaseOrderInvoiceID int
AS
Begin
 Delete [dbo].[PruchaseOrderInvoices] where     PurchaseOrderInvoiceID = @PurchaseOrderInvoiceID
End

CREATE PROCEDURE [dbo].[GetByIDPruchaseOrderInvoices]
    @PurchaseOrderInvoiceID int
AS
BEGIN
Select PurchaseOrderInvoiceID, PurchaseOrderID, RequiredPaidValue, RequiredPaidValueInEuro, RateToEuro, IsPaid, InvoiceDate
From [dbo].[PruchaseOrderInvoices]
WHERE [PurchaseOrderInvoiceID] = @PurchaseOrderInvoiceID
END

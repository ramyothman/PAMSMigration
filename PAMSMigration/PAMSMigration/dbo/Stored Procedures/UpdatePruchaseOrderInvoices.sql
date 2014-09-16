CREATE PROCEDURE [dbo].[UpdatePruchaseOrderInvoices]
    @OldPurchaseOrderInvoiceID int,
    @PurchaseOrderID int,
    @RequiredPaidValue decimal(18,2),
    @RequiredPaidValueInEuro decimal(18,2),
    @RateToEuro decimal(18,2),
    @IsPaid bit,
    @InvoiceDate date
AS
UPDATE [dbo].[PruchaseOrderInvoices]
SET
    PurchaseOrderID = @PurchaseOrderID,
    RequiredPaidValue = @RequiredPaidValue,
    RequiredPaidValueInEuro = @RequiredPaidValueInEuro,
    RateToEuro = @RateToEuro,
    IsPaid = @IsPaid,
    InvoiceDate = @InvoiceDate
WHERE [PurchaseOrderInvoiceID] = @OLDPurchaseOrderInvoiceID
IF @@ROWCOUNT > 0
Select * From PruchaseOrderInvoices 
Where [PurchaseOrderInvoiceID] = @OLDPurchaseOrderInvoiceID

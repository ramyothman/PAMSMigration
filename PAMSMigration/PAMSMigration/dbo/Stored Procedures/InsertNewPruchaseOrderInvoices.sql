CREATE PROCEDURE [dbo].[InsertNewPruchaseOrderInvoices]
    @PurchaseOrderID int,
    @RequiredPaidValue decimal(18,2),
    @RequiredPaidValueInEuro decimal(18,2),
    @RateToEuro decimal(18,2),
    @IsPaid bit,
    @InvoiceDate date
AS
INSERT INTO [dbo].[PruchaseOrderInvoices] (
    [PurchaseOrderID],
    [RequiredPaidValue],
    [RequiredPaidValueInEuro],
    [RateToEuro],
    [IsPaid],
    [InvoiceDate])
Values (
    @PurchaseOrderID,
    @RequiredPaidValue,
    @RequiredPaidValueInEuro,
    @RateToEuro,
    @IsPaid,
    @InvoiceDate)
IF @@ROWCOUNT > 0
Select * from PruchaseOrderInvoices
Where [PurchaseOrderInvoiceID] = @@identity

CREATE PROCEDURE [dbo].[UpdatePurchaseOrder]
    @CreationDate datetime,
    @CurrencyID int,
    @Deduction decimal(18,2),
    @DeductionInEuro decimal(18,2),
    @PurchaseDate datetime,
    @PurchaseNo nvarchar(50),
    @OldPurchaseOrderID int,
    @RateToEuro decimal(18,2),
    @SupplierID int,
    @SupplierNo nvarchar(50),
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @IsRFQ bit,
    @IsPOConvert bit = 'false'
AS
UPDATE [dbo].[PurchaseOrder]
SET
    CreationDate = @CreationDate,
    CurrencyID = @CurrencyID,
    Deduction = @Deduction,
    DeductionInEuro = @DeductionInEuro,
    PurchaseDate = @PurchaseDate,
    PurchaseNo = @PurchaseNo,
    RateToEuro = @RateToEuro,
    SupplierID = @SupplierID,
    SupplierNo = @SupplierNo,
    TotalPrice = @TotalPrice,
    TotalPriceInEuro = @TotalPriceInEuro ,
    IsRFQ = @IsRFQ,
    IsPoConvert = @IsPOConvert
WHERE [PurchaseOrderID] = @OLDPurchaseOrderID
IF @@ROWCOUNT > 0
Select * From PurchaseOrder 
Where [PurchaseOrderID] = @OLDPurchaseOrderID

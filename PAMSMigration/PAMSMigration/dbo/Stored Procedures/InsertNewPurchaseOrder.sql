CREATE PROCEDURE [dbo].[InsertNewPurchaseOrder]
    @CreationDate datetime,
    @CurrencyID int,
    @Deduction decimal(18,2),
    @DeductionInEuro decimal(18,2),
    @PurchaseDate datetime,
    @PurchaseNo nvarchar(50),
    @RateToEuro decimal(18,2),
    @SupplierID int,
    @SupplierNo nvarchar(50),
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @CalculationSheetID int,
    @IsRFQ bit ,
    @IsPOConvert bit = 'false'
AS
INSERT INTO [dbo].[PurchaseOrder] (
    [CreationDate],
    [CurrencyID],
    [Deduction],
    [DeductionInEuro],
    [PurchaseDate],
    [PurchaseNo],
    [RateToEuro],
    [SupplierID],
    [SupplierNo],
    [TotalPrice],
    [TotalPriceInEuro],
    [CalculationSheetID] ,
     [IsRFQ],
     [IsPOConvert]
     
    )
Values (
    @CreationDate,
    @CurrencyID,
    @Deduction,
    @DeductionInEuro,
    @PurchaseDate,
    @PurchaseNo,
    @RateToEuro,
    @SupplierID,
    @SupplierNo,
    @TotalPrice,
    @TotalPriceInEuro,
    @CalculationSheetID ,
    @IsRFQ,
    @IsPOConvert)
IF @@ROWCOUNT > 0
Select * from PurchaseOrder
Where [PurchaseOrderID] = @@identity

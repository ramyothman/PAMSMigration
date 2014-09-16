CREATE PROCEDURE [dbo].[UpdateCalculationSheet]
    @OldCalculationSheetID int,
    @Deduction decimal(18,2),
    @InquiryNumber nvarchar(50),
    @Margin decimal(18,2),
    @Memo ntext,
    @OfferCurrencyID int,
    @Reference nvarchar(150),
    @RequiredDestination int,
    @RiskFactorPercentage decimal(18,2),
    @Total decimal(18,2),
    @TotalWithoutTaxes decimal(18,2),
    @SheetDate Datetime,
    @SalesTax decimal(18,2)
AS
UPDATE [dbo].[CalculationSheet]
SET
    Deduction = @Deduction,
    InquiryNumber = @InquiryNumber,
    Margin = @Margin,
    Memo = @Memo,
    OfferCurrencyID = @OfferCurrencyID,
    Reference = @Reference,
    RequiredDestination = @RequiredDestination,
    RiskFactorPercentage = @RiskFactorPercentage,
    Total = @Total,
    TotalWithoutTaxes = @TotalWithoutTaxes,
    SheetDate = @SheetDate ,
    SalesTax =@SalesTax 
WHERE [CalculationSheetID] = @OLDCalculationSheetID
IF @@ROWCOUNT > 0
Select * From CalculationSheet 
Where [CalculationSheetID] = @OLDCalculationSheetID

CREATE PROCEDURE [dbo].[InsertNewCalculationSheet]
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
INSERT INTO [dbo].[CalculationSheet] (
    [Deduction],
    [InquiryNumber],
    [Margin],
    [Memo],
    [OfferCurrencyID],
    [Reference],
    [RequiredDestination],
    [RiskFactorPercentage],
    [Total],
    [TotalWithoutTaxes],
    [SheetDate],
    [SalesTax]    
    )
Values (
    @Deduction,
    @InquiryNumber,
    @Margin,
    @Memo,
    @OfferCurrencyID,
    @Reference,
    @RequiredDestination,
    @RiskFactorPercentage,
    @Total,
    @TotalWithoutTaxes,
    @SheetDate ,
    @SalesTax
    )
IF @@ROWCOUNT > 0
Select * from CalculationSheet
Where [CalculationSheetID] = @@identity

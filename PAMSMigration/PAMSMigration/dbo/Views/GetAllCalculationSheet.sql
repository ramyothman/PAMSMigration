CREATE VIEW [dbo].[GetAllCalculationSheet]
AS
SELECT     CalculationSheetID, InquiryNumber, OfferCurrencyID, RiskFactorPercentage, Margin, RequiredDestination, Memo, Reference, TotalWithoutTaxes, Deduction, Total, 
                      ISNULL(SheetDate, GETDATE()) AS SheetDate, SheetDate AS Expr1, SalesTax
FROM         dbo.CalculationSheet

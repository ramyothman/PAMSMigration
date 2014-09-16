CREATE VIEW [dbo].[ViewCalculationSheetDetails]
AS
SELECT     dbo.CalculationSheet.CalculationSheetID, dbo.CalculationSheet.InquiryNumber, dbo.Currencies.CurrencyCode AS OfferCurrency, 
                      dbo.CalculationSheet.RiskFactorPercentage, dbo.CalculationSheet.Margin, dbo.CalculationSheet.RequiredDestination, dbo.CalculationSheet.Memo, 
                      dbo.CalculationSheet.Reference, dbo.CalculationSheet.TotalWithoutTaxes, dbo.CalculationSheet.Deduction, dbo.CalculationSheet.Total, 
                      dbo.CalculationSheet.SheetDate, dbo.CalculationSheetDetail.ItemNumber, dbo.Category.Name AS CategoryName, dbo.Product.Name AS ProductName, 
                      dbo.CalculationSheetDetail.UnitCost, dbo.CalculationSheetDetail.Quantity, dbo.CalculationSheetDetail.UnitPriceWithTaxes, dbo.CalculationSheetDetail.UnitPrice, 
                      dbo.CalculationSheetDetail.SubTotalCost, dbo.CalculationSheetDetail.PriceBase, dbo.CalculationSheetDetail.SubTotalPrice, 
                      Currencies_1.CurrencyCode AS ProductCurrency, dbo.PriceBase.PriceBaseCode, dbo.PriceBase.PriceBaseName, dbo.CalculationSheetDetail.RateToEuro, 
                      dbo.CalculationSheetDetail.PriceInEuro, dbo.CalculationSheetDetail.RateToOfferCurrency, dbo.CalculationSheetDetail.PriceInOfferCurrency, 
                      dbo.CalculationSheetDetail.ParentID, dbo.CalculationSheetDetail.ItemDescription, dbo.CalculationSheetDetail.Margin AS Expr1
FROM         dbo.Currencies INNER JOIN
                      dbo.CalculationSheet INNER JOIN
                      dbo.CalculationSheetDetail ON dbo.CalculationSheet.CalculationSheetID = dbo.CalculationSheetDetail.CalculationSheetID ON 
                      dbo.Currencies.ID = dbo.CalculationSheet.OfferCurrencyID INNER JOIN
                      dbo.Currencies AS Currencies_1 ON dbo.CalculationSheetDetail.CurrencyID = Currencies_1.ID INNER JOIN
                      dbo.PriceBase ON dbo.CalculationSheetDetail.PriceBaseID = dbo.PriceBase.ID LEFT OUTER JOIN
                      dbo.Category INNER JOIN
                      dbo.Product ON dbo.Category.CategoryID = dbo.Product.CategoryID ON dbo.CalculationSheetDetail.ItemID = dbo.Product.ProductID

CREATE VIEW [dbo].[GetAllCalculationSheetDetail]
AS
SELECT     CalculationSheetDetailID, CalculationSheetID, ItemNumber, ItemID, ProductID, UnitCost, Quantity, UnitPrice, SubTotalCost, PriceBase, SubTotalPrice, CurrencyID, 
                      PriceBaseID, RateToEuro, PriceInEuro, UnitPriceWithTaxes, RateToOfferCurrency, PriceInOfferCurrency, ParentID, ItemDescription, Margin
FROM         dbo.CalculationSheetDetail

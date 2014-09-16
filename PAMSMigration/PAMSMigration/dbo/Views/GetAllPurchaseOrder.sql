CREATE VIEW [dbo].[GetAllPurchaseOrder]
AS
SELECT     PurchaseOrderID, SupplierID, SupplierNo, PurchaseNo, TotalPrice, RateToEuro, TotalPriceInEuro, Deduction, DeductionInEuro, CurrencyID, CreationDate, 
                      PurchaseDate, CalculationSheetID, IsRFQ, IsPOConvert
FROM         dbo.PurchaseOrder

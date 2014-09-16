CREATE VIEW [dbo].[GetAllCalculationSheetDetailFreight]
AS
SELECT        dbo.CalculationSheetDetailFreight.CalculationSheetDetailFreightID, dbo.CalculationSheetDetailFreight.CalculationSheetDetailID, dbo.CalculationSheetDetailFreight.FreightBaseID, 
                         dbo.CalculationSheetDetailFreight.FreightPrice, dbo.CalculationSheetDetailFreight.FreightCurrencyID, dbo.CalculationSheetDetailFreight.FreightRateToCurrencyBase, 
                         dbo.CalculationSheetDetailFreight.FreightPriceInCurrencyBase, dbo.CalculationSheetDetail.CalculationSheetID
FROM            dbo.CalculationSheetDetailFreight INNER JOIN
                         dbo.CalculationSheetDetail ON dbo.CalculationSheetDetailFreight.CalculationSheetDetailID = dbo.CalculationSheetDetail.CalculationSheetDetailID

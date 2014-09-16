CREATE VIEW [dbo].[GetAllCalculationSheetDetailTaxes]
AS
SELECT        dbo.CalculationSheetDetailTaxes.CalculationSheetDetailTaxID, dbo.CalculationSheetDetailTaxes.CalculationSheetDetailID, dbo.CalculationSheetDetailTaxes.TaxID, 
                         dbo.CalculationSheetDetail.CalculationSheetID
FROM            dbo.CalculationSheetDetailTaxes INNER JOIN
                         dbo.CalculationSheetDetail ON dbo.CalculationSheetDetailTaxes.CalculationSheetDetailID = dbo.CalculationSheetDetail.CalculationSheetDetailID

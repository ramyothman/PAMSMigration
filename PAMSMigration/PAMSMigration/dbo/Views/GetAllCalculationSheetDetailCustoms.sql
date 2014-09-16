CREATE VIEW [dbo].[GetAllCalculationSheetDetailCustoms]
AS
SELECT        dbo.CalculationSheetDetailCustoms.CalculationSheetDetailCustomID, dbo.CalculationSheetDetailCustoms.CalculationSheetDetailID, dbo.CalculationSheetDetailCustoms.ProductCustomID, 
                         dbo.CalculationSheetDetailCustoms.Amount, dbo.CalculationSheetDetail.CalculationSheetID
FROM            dbo.CalculationSheetDetailCustoms INNER JOIN
                         dbo.CalculationSheetDetail ON dbo.CalculationSheetDetailCustoms.CalculationSheetDetailID = dbo.CalculationSheetDetail.CalculationSheetDetailID

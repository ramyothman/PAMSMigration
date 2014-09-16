CREATE PROCEDURE [dbo].[GetByIDCalculationSheetDetailCustoms]
    @CalculationSheetDetailCustomID int
AS
BEGIN
Select Amount, CalculationSheetDetailCustomID, CalculationSheetDetailID, ProductCustomID
From [dbo].[CalculationSheetDetailCustoms]
WHERE [CalculationSheetDetailCustomID] = @CalculationSheetDetailCustomID
END

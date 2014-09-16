CREATE PROCEDURE [dbo].[GetByIDCalculationSheetDetail]
    @CalculationSheetDetailID int
AS
BEGIN
Select *
From [dbo].[CalculationSheetDetail]
WHERE [CalculationSheetDetailID] = @CalculationSheetDetailID
END

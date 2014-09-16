CREATE PROCEDURE [dbo].[GetByIDCalculationSheet]
    @CalculationSheetID int
AS
BEGIN
Select *
From [dbo].[CalculationSheet]
WHERE [CalculationSheetID] = @CalculationSheetID
END

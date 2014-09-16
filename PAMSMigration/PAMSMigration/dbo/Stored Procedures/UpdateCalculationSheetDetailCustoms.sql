CREATE PROCEDURE [dbo].[UpdateCalculationSheetDetailCustoms]
    @Amount decimal(18,2),
    @OldCalculationSheetDetailCustomID int,
    @CalculationSheetDetailID int,
    @ProductCustomID int
AS
UPDATE [dbo].[CalculationSheetDetailCustoms]
SET
    Amount = @Amount,
    CalculationSheetDetailID = @CalculationSheetDetailID,
    ProductCustomID = @ProductCustomID
WHERE [CalculationSheetDetailCustomID] = @OLDCalculationSheetDetailCustomID
IF @@ROWCOUNT > 0
Select * From CalculationSheetDetailCustoms 
Where [CalculationSheetDetailCustomID] = @OLDCalculationSheetDetailCustomID

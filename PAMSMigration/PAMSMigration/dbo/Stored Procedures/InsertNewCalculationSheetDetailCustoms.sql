CREATE PROCEDURE [dbo].[InsertNewCalculationSheetDetailCustoms]
    @Amount decimal(18,2),
    @CalculationSheetDetailID int,
    @ProductCustomID int
AS
INSERT INTO [dbo].[CalculationSheetDetailCustoms] (
    [Amount],
    [CalculationSheetDetailID],
    [ProductCustomID])
Values (
    @Amount,
    @CalculationSheetDetailID,
    @ProductCustomID)
IF @@ROWCOUNT > 0
Select * from CalculationSheetDetailCustoms
Where [CalculationSheetDetailCustomID] = @@identity

CREATE PROCEDURE [dbo].[DeleteCalculationSheetDetailCustoms]
    @CalculationSheetDetailCustomID int
AS
Begin
 Delete [dbo].[CalculationSheetDetailCustoms] where     [CalculationSheetDetailCustomID] = @CalculationSheetDetailCustomID
End

CREATE PROCEDURE [dbo].[DeleteCalculationSheet]
    @CalculationSheetID int
AS
Begin
 Delete [dbo].[CalculationSheet] where     [CalculationSheetID] = @CalculationSheetID
End

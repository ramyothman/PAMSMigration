CREATE PROCEDURE [dbo].[DeleteCalculationSheetDetailFreight]
    @CalculationSheetDetailFreightID int
AS
Begin
 Delete [dbo].[CalculationSheetDetailFreight] where     [CalculationSheetDetailFreightID] = @CalculationSheetDetailFreightID
End

CREATE PROCEDURE [dbo].[DeleteCalculationSheetDetailTaxes]
    @CalculationSheetDetailTaxID int
AS
Begin
 Delete [dbo].[CalculationSheetDetailTaxes] where     [CalculationSheetDetailTaxID] = @CalculationSheetDetailTaxID
End

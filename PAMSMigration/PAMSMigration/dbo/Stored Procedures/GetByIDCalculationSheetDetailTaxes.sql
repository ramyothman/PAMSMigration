CREATE PROCEDURE [dbo].[GetByIDCalculationSheetDetailTaxes]
    @CalculationSheetDetailTaxID int
AS
BEGIN
Select CalculationSheetDetailID, CalculationSheetDetailTaxID, TaxID
From [dbo].[CalculationSheetDetailTaxes]
WHERE [CalculationSheetDetailTaxID] = @CalculationSheetDetailTaxID
END

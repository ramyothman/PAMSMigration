CREATE PROCEDURE [dbo].[UpdateCalculationSheetDetailTaxes]
    @CalculationSheetDetailID int,
    @OldCalculationSheetDetailTaxID int,
    @TaxID int
AS
UPDATE [dbo].[CalculationSheetDetailTaxes]
SET
    CalculationSheetDetailID = @CalculationSheetDetailID,
    TaxID = @TaxID
WHERE [CalculationSheetDetailTaxID] = @OLDCalculationSheetDetailTaxID
IF @@ROWCOUNT > 0
Select * From CalculationSheetDetailTaxes 
Where [CalculationSheetDetailTaxID] = @OLDCalculationSheetDetailTaxID

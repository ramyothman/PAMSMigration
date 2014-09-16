CREATE PROCEDURE [dbo].[InsertNewCalculationSheetDetailTaxes]
    @CalculationSheetDetailID int,
    @TaxID int
AS
INSERT INTO [dbo].[CalculationSheetDetailTaxes] (
    [CalculationSheetDetailID],
    [TaxID])
Values (
    @CalculationSheetDetailID,
    @TaxID)
IF @@ROWCOUNT > 0
Select * from CalculationSheetDetailTaxes
Where [CalculationSheetDetailTaxID] = @@identity

CREATE PROCEDURE [dbo].[GetByIDTaxes]
    @TaxID int
AS
BEGIN
Select Amount, IsPercent, Name, TaxID
From [dbo].[Taxes]
WHERE [TaxID] = @TaxID
END

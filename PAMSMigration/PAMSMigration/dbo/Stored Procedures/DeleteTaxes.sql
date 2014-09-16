CREATE PROCEDURE [dbo].[DeleteTaxes]
    @TaxID int
AS
Begin
 Delete [dbo].[Taxes] where     [TaxID] = @TaxID
End

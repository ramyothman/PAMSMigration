CREATE PROCEDURE [dbo].[UpdateTaxes]
    @Amount decimal(18,2),
    @IsPercent bit,
    @Name nvarchar(50),
    @OldTaxID int
AS
UPDATE [dbo].[Taxes]
SET
    Amount = @Amount,
    IsPercent = @IsPercent,
    Name = @Name
WHERE [TaxID] = @OLDTaxID
IF @@ROWCOUNT > 0
Select * From Taxes 
Where [TaxID] = @OLDTaxID

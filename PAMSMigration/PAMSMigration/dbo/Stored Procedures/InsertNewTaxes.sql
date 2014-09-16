CREATE PROCEDURE [dbo].[InsertNewTaxes]
    @Amount decimal(18,2),
    @IsPercent bit,
    @Name nvarchar(50)
AS
INSERT INTO [dbo].[Taxes] (
    [Amount],
    [IsPercent],
    [Name])
Values (
    @Amount,
    @IsPercent,
    @Name)
IF @@ROWCOUNT > 0
Select * from Taxes
Where [TaxID] = @@identity

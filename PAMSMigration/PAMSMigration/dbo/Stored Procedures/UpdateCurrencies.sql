CREATE PROCEDURE [dbo].[UpdateCurrencies]
    @CurrencyCode nvarchar(50),
    @OldID int,
    @CurrencyName nvarchar(50)
AS
UPDATE [dbo].[Currencies]
SET
    CurrencyCode = @CurrencyCode,
    CurrencyName = @CurrencyName
WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
Select * From Currencies 
Where [ID] = @OldID

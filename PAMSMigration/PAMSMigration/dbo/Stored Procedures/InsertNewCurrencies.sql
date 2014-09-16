CREATE PROCEDURE [dbo].[InsertNewCurrencies]
    @CurrencyCode nvarchar(50),
    @CurrencyName nvarchar(50)
AS
INSERT INTO [dbo].[Currencies] (
    [CurrencyCode],
    [CurrencyName])
Values (
    @CurrencyCode,
    @CurrencyName)
IF @@ROWCOUNT > 0
Select * from Currencies
Where [ID] = @@IDENTITY

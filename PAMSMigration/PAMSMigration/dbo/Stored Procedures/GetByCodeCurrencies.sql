Create PROCEDURE [dbo].[GetByCodeCurrencies]
    @Code nvarchar(50)
AS
BEGIN
Select *
From [dbo].[Currencies]
WHERE CurrencyCode = @Code
END

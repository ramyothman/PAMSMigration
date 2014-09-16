CREATE VIEW [dbo].[GetAllCurrencies]
AS
SELECT     CurrencyCode, CurrencyName, CurrencyNameSL, ID
FROM         dbo.Currencies

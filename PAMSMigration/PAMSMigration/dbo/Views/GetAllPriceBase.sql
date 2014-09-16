CREATE VIEW [dbo].[GetAllPriceBase]
AS
SELECT     PriceBaseCode, PriceBaseName, PriceBaseDescription, ID
FROM         dbo.PriceBase

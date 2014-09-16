CREATE PROCEDURE [dbo].[GetByIDItems]
    @ItemID int
AS
BEGIN
Select CategoryID, CostPrice, CostPriceInEuro, CurrencyID, ItemID, Name, ProductTypeID, RateToEuro
From [dbo].[Items]
WHERE [ItemID] = @ItemID
END

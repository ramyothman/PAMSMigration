CREATE PROCEDURE [dbo].[GetByIDOffers]
    @OfferID int
AS
BEGIN
Select CalculationSheetID, ClientID, CreationDate, CurrencyID, Discount, DiscountInEuro, IsCompletelyOrdered, OfferDate, OfferID, OfferNo, RateToEuro, TotalPrice, TotalPriceInEuro, TotalPriceWithTaxes, TotalWithTaxesInEuro
From [dbo].[Offers]
WHERE [OfferID] = @OfferID
END

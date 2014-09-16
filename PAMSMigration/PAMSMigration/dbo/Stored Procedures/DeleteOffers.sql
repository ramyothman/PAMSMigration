CREATE PROCEDURE [dbo].[DeleteOffers]
    @OfferID int
AS
Begin
 Delete [dbo].[Offers] where     [OfferID] = @OfferID
End

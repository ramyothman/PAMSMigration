CREATE PROCEDURE [dbo].[DeleteOfferDetails]
    @OfferDetailsID int
AS
Begin
 Delete [dbo].[OfferDetails] where     [OfferDetailsID] = @OfferDetailsID
End

CREATE PROCEDURE [dbo].[GetByIDOfferDetails]
    @OfferDetailsID int
AS
BEGIN
Select *
From [dbo].[OfferDetails]
WHERE [OfferDetailsID] = @OfferDetailsID
END

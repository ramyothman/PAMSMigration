CREATE PROCEDURE [dbo].[UpdateOfferDetails]
    @CurrencyID int,
    @Discount decimal(18,2),
    @DiscountInEuro decimal(18,2),
    @IsOrdered bit,
    @OldOfferDetailsID int,
    @OfferID int,
    @Price decimal(18,2),
    @PriceInEuro decimal(18,2),
    @PriceWithTaxes decimal(18,2),
    @PriceWithTaxesInEuro decimal(18,2),
    @RateToEuro decimal(18,2),
    @Qty int ,
    @ItemID int
AS
UPDATE [dbo].[OfferDetails]
SET
    CurrencyID = @CurrencyID,
    Discount = @Discount,
    DiscountInEuro = @DiscountInEuro,
    IsOrdered = @IsOrdered,
    OfferID = @OfferID,
    Price = @Price,
    PriceInEuro = @PriceInEuro,
    PriceWithTaxes = @PriceWithTaxes,
    PriceWithTaxesInEuro = @PriceWithTaxesInEuro,
    RateToEuro = @RateToEuro,
    Qty = @Qty ,
    ItemID = @itemID
WHERE [OfferDetailsID] = @OLDOfferDetailsID
IF @@ROWCOUNT > 0
Select * From OfferDetails 
Where [OfferDetailsID] = @OLDOfferDetailsID

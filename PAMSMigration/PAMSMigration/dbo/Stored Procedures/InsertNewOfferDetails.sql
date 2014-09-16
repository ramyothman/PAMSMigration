CREATE PROCEDURE [dbo].[InsertNewOfferDetails]
    @CurrencyID int,
    @Discount decimal(18,2),
    @DiscountInEuro decimal(18,2),
    @IsOrdered bit,
    @OfferID int,
    @Price decimal(18,2),
    @PriceInEuro decimal(18,2),
    @PriceWithTaxes decimal(18,2),
    @PriceWithTaxesInEuro decimal(18,2),
    @RateToEuro decimal(18,2),
    @Qty int,
    @ItemID int
AS
INSERT INTO [dbo].[OfferDetails] (
    [CurrencyID],
    [Discount],
    [DiscountInEuro],
    [IsOrdered],
    [OfferID],
    [Price],
    [PriceInEuro],
    [PriceWithTaxes],
    [PriceWithTaxesInEuro],
    [RateToEuro],
    [Qty],
    [ItemID])
Values (
    @CurrencyID,
    @Discount,
    @DiscountInEuro,
    @IsOrdered,
    @OfferID,
    @Price,
    @PriceInEuro,
    @PriceWithTaxes,
    @PriceWithTaxesInEuro,
    @RateToEuro,
    @Qty,
    @ItemID)
IF @@ROWCOUNT > 0
Select * from OfferDetails
Where [OfferDetailsID] = @@identity

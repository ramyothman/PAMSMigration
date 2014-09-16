CREATE PROCEDURE [dbo].[InsertNewOffers]
    @CalculationSheetID int,
    @ClientID int,
    @CreationDate datetime,
    @CurrencyID int,
    @Discount decimal(18,2),
    @DiscountInEuro decimal(18,2),
    @IsCompletelyOrdered bit,
    @OfferDate datetime,
    @OfferNo nvarchar(50),
    @RateToEuro decimal(18,2),
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @TotalPriceWithTaxes decimal(18,2),
    @TotalWithTaxesInEuro decimal(18,2)
AS
INSERT INTO [dbo].[Offers] (
    [CalculationSheetID],
    [ClientID],
    [CreationDate],
    [CurrencyID],
    [Discount],
    [DiscountInEuro],
    [IsCompletelyOrdered],
    [OfferDate],
    [OfferNo],
    [RateToEuro],
    [TotalPrice],
    [TotalPriceInEuro],
    [TotalPriceWithTaxes],
    [TotalWithTaxesInEuro])
Values (
    @CalculationSheetID,
    @ClientID,
    @CreationDate,
    @CurrencyID,
    @Discount,
    @DiscountInEuro,
    @IsCompletelyOrdered,
    @OfferDate,
    @OfferNo,
    @RateToEuro,
    @TotalPrice,
    @TotalPriceInEuro,
    @TotalPriceWithTaxes,
    @TotalWithTaxesInEuro)
IF @@ROWCOUNT > 0
Select * from Offers
Where [OfferID] = @@identity

CREATE PROCEDURE [dbo].[UpdateOffers]
    @CalculationSheetID int,
    @ClientID int,
    @CreationDate datetime,
    @CurrencyID int,
    @Discount decimal(18,2),
    @DiscountInEuro decimal(18,2),
    @IsCompletelyOrdered bit,
    @OfferDate datetime,
    @OldOfferID int,
    @OfferNo nvarchar(50),
    @RateToEuro decimal(18,2),
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @TotalPriceWithTaxes decimal(18,2),
    @TotalWithTaxesInEuro decimal(18,2)
AS
UPDATE [dbo].[Offers]
SET
    CalculationSheetID = @CalculationSheetID,
    ClientID = @ClientID,
    CreationDate = @CreationDate,
    CurrencyID = @CurrencyID,
    Discount = @Discount,
    DiscountInEuro = @DiscountInEuro,
    IsCompletelyOrdered = @IsCompletelyOrdered,
    OfferDate = @OfferDate,
    OfferNo = @OfferNo,
    RateToEuro = @RateToEuro,
    TotalPrice = @TotalPrice,
    TotalPriceInEuro = @TotalPriceInEuro,
    TotalPriceWithTaxes = @TotalPriceWithTaxes,
    TotalWithTaxesInEuro = @TotalWithTaxesInEuro
WHERE [OfferID] = @OLDOfferID
IF @@ROWCOUNT > 0
Select * From Offers 
Where [OfferID] = @OLDOfferID

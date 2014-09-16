CREATE PROCEDURE [dbo].[UpdateCalculationSheetDetail]
    @OldCalculationSheetDetailID int,
    @CalculationSheetID int,
    @CurrencyID int,
    @ItemID int = null ,
    @ItemNumber int,
    @PriceBase int,
    @PriceBaseID int,
    @PriceInEuro decimal(18,2),
    @ProductID int,
    @Quantity decimal(18,2),
    @RateToEuro decimal(18,2),
    @SubTotalCost decimal(18,2),
    @SubTotalPrice decimal(18,2),
    @UnitCost decimal(18,2),
    @UnitPrice decimal(18,2),
    @UnitPriceWithTaxes decimal(18,2) ,
    @RateToOfferCurrency decimal(18,2),
    @PriceInOfferCurrency decimal(18,2),
	@ParentID int,
	@ItemDescription nvarchar(250),
	@Margin decimal(5,2)
AS
UPDATE [dbo].[CalculationSheetDetail]
SET
    CalculationSheetID = @CalculationSheetID,
    CurrencyID = @CurrencyID,
    ItemID = @ItemID,
    ItemNumber = @ItemNumber,
    PriceBase = @PriceBase,
    PriceBaseID = @PriceBaseID,
    PriceInEuro = @PriceInEuro,
    ProductID = @ProductID,
    Quantity = @Quantity,
    RateToEuro = @RateToEuro,
    SubTotalCost = @SubTotalCost,
    SubTotalPrice = @SubTotalPrice,
    UnitCost = @UnitCost,
    UnitPrice = @UnitPrice ,
    UnitPriceWithTaxes = @UnitPriceWithTaxes,
    RateToOfferCurrency= @RateToOfferCurrency,
    PriceInOfferCurrency = @PriceInOfferCurrency,
	ParentID = @ParentID,
	ItemDescription = @ItemDescription ,
	Margin = @Margin 
WHERE [CalculationSheetDetailID] = @OLDCalculationSheetDetailID
IF @@ROWCOUNT > 0
Select * From CalculationSheetDetail 
Where [CalculationSheetDetailID] = @OLDCalculationSheetDetailID

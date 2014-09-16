CREATE PROCEDURE [dbo].[UpdateItems]
    @CategoryID int,
    @CostPrice decimal(18,2),
    @CostPriceInEuro decimal(18,2),
    @CurrencyID int,
    @OldItemID int,
    @Name nvarchar(mAX),
    @ProductTypeID int,
    @RateToEuro decimal(18,2)
AS
UPDATE [dbo].[Items]
SET
    CategoryID = @CategoryID,
    CostPrice = @CostPrice,
    CostPriceInEuro = @CostPriceInEuro,
    CurrencyID = @CurrencyID,
    Name = @Name,
    ProductTypeID = @ProductTypeID,
    RateToEuro = @RateToEuro
WHERE [ItemID] = @OLDItemID
IF @@ROWCOUNT > 0
Select * From Items 
Where [ItemID] = @OLDItemID

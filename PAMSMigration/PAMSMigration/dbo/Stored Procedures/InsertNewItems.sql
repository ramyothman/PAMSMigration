CREATE PROCEDURE [dbo].[InsertNewItems]
    @CategoryID int,
    @CostPrice decimal(18,2),
    @CostPriceInEuro decimal(18,2),
    @CurrencyID int,
    @Name nvarchar(MAX),
    @ProductTypeID int,
    @RateToEuro decimal(18,2)
AS
INSERT INTO [dbo].[Items] (
    [CategoryID],
    [CostPrice],
    [CostPriceInEuro],
    [CurrencyID],
    [Name],
    [ProductTypeID],
    [RateToEuro])
Values (
    @CategoryID,
    @CostPrice,
    @CostPriceInEuro,
    @CurrencyID,
    @Name,
    @ProductTypeID,
    @RateToEuro)
IF @@ROWCOUNT > 0
Select * from Items
Where [ItemID] = @@identity

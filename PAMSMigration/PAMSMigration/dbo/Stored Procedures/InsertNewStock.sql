CREATE PROCEDURE [dbo].[InsertNewStock]
    @INQuantity int,
    @ItemID int,
    @OutQuantity int
AS
INSERT INTO [dbo].[Stock] (
    [INQuantity],
    [ItemID],
    [OutQuantity])
Values (
    @INQuantity,
    @ItemID,
    @OutQuantity)
IF @@ROWCOUNT > 0
Select * from Stock
Where [StockID] = @@identity

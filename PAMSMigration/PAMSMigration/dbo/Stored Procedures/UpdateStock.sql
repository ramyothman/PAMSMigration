CREATE PROCEDURE [dbo].[UpdateStock]
    @INQuantity int,
    @ItemID int,
    @OutQuantity int,
    @OldStockID int
AS
UPDATE [dbo].[Stock]
SET
    INQuantity = @INQuantity,
    ItemID = @ItemID,
    OutQuantity = @OutQuantity
WHERE [StockID] = @OLDStockID
IF @@ROWCOUNT > 0
Select * From Stock 
Where [StockID] = @OLDStockID

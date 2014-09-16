CREATE PROCEDURE [dbo].[GetByIDStock]
    @StockID int
AS
BEGIN
Select INQuantity, ItemID, OutQuantity, StockID
From [dbo].[Stock]
WHERE [StockID] = @StockID
END

CREATE PROCEDURE [dbo].[DeleteStock]
    @StockID int
AS
Begin
 Delete [dbo].[Stock] where     [StockID] = @StockID
End

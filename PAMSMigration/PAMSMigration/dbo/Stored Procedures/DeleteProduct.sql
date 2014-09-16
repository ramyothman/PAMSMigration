CREATE PROCEDURE [dbo].[DeleteProduct]
    @ProductID int
AS
Begin
 Delete [dbo].[Product] where     [ProductID] = @ProductID
End

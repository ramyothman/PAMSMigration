CREATE PROCEDURE [dbo].[DeleteProducts]
    @ProductID int
AS
Begin
 Delete [dbo].[Products] where     [ProductID] = @ProductID
End

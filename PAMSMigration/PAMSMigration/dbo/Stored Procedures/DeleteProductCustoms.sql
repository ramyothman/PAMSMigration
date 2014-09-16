CREATE PROCEDURE [dbo].[DeleteProductCustoms]
    @ProductCustomID int
AS
Begin
 Delete [dbo].[ProductCustoms] where     [ProductCustomID] = @ProductCustomID
End

CREATE PROCEDURE [dbo].[DeleteCategory]
    @CategoryID int
AS
Begin
 Delete [dbo].[Category] where     [CategoryID] = @CategoryID
End

CREATE PROCEDURE [dbo].[DeleteCategories]
    @CategoryID int
AS
Begin
 Delete [dbo].[Categories] where     [CategoryID] = @CategoryID
End

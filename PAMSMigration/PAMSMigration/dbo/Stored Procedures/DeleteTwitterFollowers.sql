CREATE PROCEDURE [dbo].[DeleteTwitterFollowers]
    @ID int
AS
Begin
 DELETE FROM [dbo].[TwitterFollowers]
 where     [ID] = @ID
End

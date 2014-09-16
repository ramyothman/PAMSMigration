CREATE PROCEDURE [dbo].[DeletePersonsBranches]
    @ID int
AS
Begin
 Delete [dbo].[PersonsBranches] where ID = @ID
End

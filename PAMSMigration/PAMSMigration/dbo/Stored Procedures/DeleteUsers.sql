CREATE PROCEDURE [dbo].[DeleteUsers]
    @ID int
AS
Begin
delete UserRoles where UserID = @ID
 Delete [dbo].[Users] where     [ID] = @ID
End

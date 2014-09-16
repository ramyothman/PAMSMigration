CREATE PROCEDURE [dbo].[DeleteUserRoles]
    @ID int
AS
Begin
 Delete [dbo].[UserRoles] where     [ID] = @ID
End

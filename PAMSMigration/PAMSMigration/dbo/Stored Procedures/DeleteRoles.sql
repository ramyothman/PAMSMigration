CREATE PROCEDURE [dbo].[DeleteRoles]
    @ID int
AS
Begin
 Delete [dbo].[Roles] where     [ID] = @ID
End

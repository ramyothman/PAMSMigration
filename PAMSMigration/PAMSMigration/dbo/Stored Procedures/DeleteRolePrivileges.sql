CREATE PROCEDURE [dbo].[DeleteRolePrivileges]
    @ID int
AS
Begin
 Delete [dbo].[RolePrivileges] where     [ID] = @ID
End

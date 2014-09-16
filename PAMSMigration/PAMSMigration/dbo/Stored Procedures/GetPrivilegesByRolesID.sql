CREATE PROCEDURE [dbo].[GetPrivilegesByRolesID]
    @ID int
AS
BEGIN
Select * 
From [dbo].[ViewRolePrivileges]
WHERE [RoleID] = @ID
END

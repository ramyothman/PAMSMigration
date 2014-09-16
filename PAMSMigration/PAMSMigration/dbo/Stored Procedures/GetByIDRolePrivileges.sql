CREATE PROCEDURE [dbo].[GetByIDRolePrivileges]
    @ID int
AS
BEGIN
Select *
From [dbo].[RolePrivileges]
WHERE [ID] = @ID
END

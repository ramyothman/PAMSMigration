CREATE PROCEDURE [dbo].[GetByRoleIDRoleSuppliers]
    @RoleId int
AS
BEGIN
Select *
From [dbo].[RoleSuppliers]
WHERE RoleId = @RoleId
END

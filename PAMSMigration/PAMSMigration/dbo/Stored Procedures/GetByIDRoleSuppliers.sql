CREATE PROCEDURE [dbo].[GetByIDRoleSuppliers]
    @RoleSupplierId int
AS
BEGIN
Select *
From [dbo].[RoleSuppliers]
WHERE [RoleSupplierId] = @RoleSupplierId
END

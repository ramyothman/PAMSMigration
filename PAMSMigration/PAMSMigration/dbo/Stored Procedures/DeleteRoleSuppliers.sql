CREATE PROCEDURE [dbo].[DeleteRoleSuppliers]
    @RoleSupplierId int
AS
Begin
 Delete [dbo].[RoleSuppliers] where     [RoleSupplierId] = @RoleSupplierId
End

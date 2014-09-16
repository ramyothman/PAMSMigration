CREATE PROCEDURE [dbo].[UpdateRoleSuppliers]
    @OldRoleSupplierId int,
    @RoleId int,
    @SupplierId int
AS
UPDATE [dbo].[RoleSuppliers]
SET
    RoleId = @RoleId,
    SupplierId = @SupplierId
WHERE [RoleSupplierId] = @OLDRoleSupplierId
IF @@ROWCOUNT > 0
Select * From RoleSuppliers 
Where [RoleSupplierId] = @OLDRoleSupplierId

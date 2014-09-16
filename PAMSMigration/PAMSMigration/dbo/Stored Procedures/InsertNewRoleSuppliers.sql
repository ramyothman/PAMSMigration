CREATE PROCEDURE [dbo].[InsertNewRoleSuppliers]
    @RoleId int,
    @SupplierId int
AS
INSERT INTO [dbo].[RoleSuppliers] (
    [RoleId],
    [SupplierId])
Values (
    @RoleId,
    @SupplierId)
IF @@ROWCOUNT > 0
Select * from RoleSuppliers
Where [RoleSupplierId] = @@identity

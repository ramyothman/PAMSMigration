Create PROCEDURE [dbo].[InsertNewProjectRegisteredSuppliers]
    @ProjectID int,
    @SupplierID int,
    @Comment ntext
AS
INSERT INTO [dbo].[ProjectRegisteredSuppliers] (
    [ProjectID],
    [SupplierID],
    [Comment])
Values (
    @ProjectID,
    @SupplierID,
    @Comment)
IF @@ROWCOUNT > 0
Select * from ProjectRegisteredSuppliers
Where [ProjectRegisteredSupplierID] = @@identity

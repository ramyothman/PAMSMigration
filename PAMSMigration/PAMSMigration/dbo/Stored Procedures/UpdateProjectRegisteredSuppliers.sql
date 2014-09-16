Create PROCEDURE [dbo].[UpdateProjectRegisteredSuppliers]
    @OldProjectRegisteredSupplierID int,
    @ProjectID int,
    @SupplierID int,
    @Comment ntext
AS
UPDATE [dbo].[ProjectRegisteredSuppliers]
SET
    ProjectID = @ProjectID,
    SupplierID = @SupplierID,
    Comment = @Comment
WHERE [ProjectRegisteredSupplierID] = @OLDProjectRegisteredSupplierID
IF @@ROWCOUNT > 0
Select * From ProjectRegisteredSuppliers 
Where [ProjectRegisteredSupplierID] = @OLDProjectRegisteredSupplierID

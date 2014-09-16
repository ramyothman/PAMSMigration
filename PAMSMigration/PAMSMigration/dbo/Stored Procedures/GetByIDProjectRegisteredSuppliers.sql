Create PROCEDURE [dbo].[GetByIDProjectRegisteredSuppliers]
    @ProjectRegisteredSupplierID int
AS
BEGIN
Select ProjectRegisteredSupplierID, ProjectID, SupplierID, Comment
From [dbo].[ProjectRegisteredSuppliers]
WHERE [ProjectRegisteredSupplierID] = @ProjectRegisteredSupplierID
END

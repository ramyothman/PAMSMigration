CREATE PROCEDURE [dbo].[GetByNameSuppliers]
    @SupplierName nvarchar(50),
    @BranchID int
AS
BEGIN
SELECT * FROM Suppliers
inner join SupplierBranch
on Suppliers.SupplierID = SupplierBranch.SupplierID
WHERE Suppliers.SupplierName = @SupplierName and SupplierBranch.BranchID = @BranchID
END

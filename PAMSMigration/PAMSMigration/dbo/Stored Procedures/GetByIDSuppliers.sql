CREATE PROCEDURE [dbo].[GetByIDSuppliers]
    @SupplierID int
AS
BEGIN
SELECT * FROM Suppliers
inner join SupplierBranch
on Suppliers.SupplierID = SupplierBranch.SupplierID
WHERE Suppliers.SupplierID = @SupplierID
END

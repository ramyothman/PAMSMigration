CREATE PROCEDURE [dbo].[DeleteSuppliers]
    @SupplierID int
AS
Begin
 Delete [dbo].[Suppliers] where     [SupplierID] = @SupplierID
End

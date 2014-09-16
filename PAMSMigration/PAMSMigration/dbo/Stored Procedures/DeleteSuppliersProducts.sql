CREATE PROCEDURE [dbo].[DeleteSuppliersProducts]
    @SupplierProductID int
AS
Begin
 Delete [dbo].[SuppliersProducts] where     [SupplierProductID] = @SupplierProductID
End

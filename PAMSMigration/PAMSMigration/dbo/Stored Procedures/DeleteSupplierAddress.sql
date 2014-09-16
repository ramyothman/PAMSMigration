CREATE PROCEDURE [dbo].[DeleteSupplierAddress]
    @SupplierAddressID int
AS
Begin
 Delete [dbo].[SupplierAddress] where     [SupplierAddressID] = @SupplierAddressID
End

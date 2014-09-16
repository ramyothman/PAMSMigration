CREATE PROCEDURE [dbo].[DeleteSuppliersEmailAddress]
    @SupplierEmailAddressID int
AS
Begin
 Delete [dbo].[SuppliersEmailAddress] where     [SupplierEmailAddressID] = @SupplierEmailAddressID
End

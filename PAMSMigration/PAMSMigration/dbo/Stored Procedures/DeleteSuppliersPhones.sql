CREATE PROCEDURE [dbo].[DeleteSuppliersPhones]
    @SupplierPhoneID int
AS
Begin
 Delete [dbo].[SuppliersPhones] where     [SupplierPhoneID] = @SupplierPhoneID
End

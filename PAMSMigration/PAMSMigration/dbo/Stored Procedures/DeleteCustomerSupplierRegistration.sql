CREATE PROCEDURE [dbo].[DeleteCustomerSupplierRegistration]
    @ID int
AS
Begin
 Delete [dbo].[CustomerSupplierRegistration] where     [ID] = @ID
End

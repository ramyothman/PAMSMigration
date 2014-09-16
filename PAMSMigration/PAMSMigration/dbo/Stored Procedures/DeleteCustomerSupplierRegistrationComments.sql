CREATE PROCEDURE [dbo].[DeleteCustomerSupplierRegistrationComments]
    @ID int
AS
Begin
 Delete [dbo].[CustomerSupplierRegistrationComments] where     [ID] = @ID
End

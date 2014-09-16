CREATE PROCEDURE [dbo].[DeleteCustomerSubFields]
    @ID int
AS
Begin
 Delete [dbo].[CustomerSubFields] where     [ID] = @ID
End

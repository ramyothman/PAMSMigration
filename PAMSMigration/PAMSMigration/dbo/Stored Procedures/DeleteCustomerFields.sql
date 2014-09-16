CREATE PROCEDURE [dbo].[DeleteCustomerFields]
    @CustomerFieldID int
AS
Begin
 Delete [dbo].[CustomerFields] where     [CustomerFieldID] = @CustomerFieldID
End

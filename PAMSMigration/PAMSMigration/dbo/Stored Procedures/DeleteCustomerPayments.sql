CREATE PROCEDURE [dbo].[DeleteCustomerPayments]
    @CustomerPaymentID int
AS
Begin
 Delete [dbo].[CustomerPayments] where     [CustomerPaymentID] = @CustomerPaymentID
End

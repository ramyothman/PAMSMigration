CREATE PROCEDURE [dbo].[DeletePaymentAccountType]
    @PaymentAccountTypeID int
AS
Begin
 Delete [dbo].[PaymentAccountType] where     [PaymentAccountTypeID] = @PaymentAccountTypeID
End

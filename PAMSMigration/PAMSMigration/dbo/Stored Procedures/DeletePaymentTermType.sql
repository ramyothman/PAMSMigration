CREATE PROCEDURE [dbo].[DeletePaymentTermType]
    @PaymentTermTypeID int
AS
Begin
 Delete [dbo].[PaymentTermType] where     [PaymentTermTypeID] = @PaymentTermTypeID
End

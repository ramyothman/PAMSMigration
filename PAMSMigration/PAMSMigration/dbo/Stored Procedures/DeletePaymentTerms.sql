CREATE PROCEDURE [dbo].[DeletePaymentTerms]
    @PaymentTermID int
AS
Begin
 Delete [dbo].[PaymentTerms] where     [PaymentTermID] = @PaymentTermID
End

CREATE PROCEDURE [dbo].[DeletePaymentTypes]
    @ID nvarchar(50)
AS
Begin
 Delete [dbo].[PaymentTypes] where     [ID] = @ID
End

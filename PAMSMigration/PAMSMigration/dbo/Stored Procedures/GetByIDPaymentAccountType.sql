CREATE PROCEDURE [dbo].[GetByIDPaymentAccountType]
    @PaymentAccountTypeID int
AS
BEGIN
Select PaymentAccountTypeID, Name
From [dbo].[PaymentAccountType]
WHERE [PaymentAccountTypeID] = @PaymentAccountTypeID
END

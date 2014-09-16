CREATE PROCEDURE [dbo].[GetByIDPaymentTermType]
    @PaymentTermTypeID int
AS
BEGIN
Select Name, PaymentTermTypeID
From [dbo].[PaymentTermType]
WHERE [PaymentTermTypeID] = @PaymentTermTypeID
END

CREATE PROCEDURE [dbo].[GetByIDPaymentTerms]
    @PaymentTermID int
AS
BEGIN
Select Description, InquiryNumber, IsJobCompleted, IsJobDownPayment, IsJobInProgress, IsPaid, IsReached, PaymentTermID, PaymentTermTypeID, PercentageValue
From [dbo].[PaymentTerms]
WHERE [PaymentTermID] = @PaymentTermID
END

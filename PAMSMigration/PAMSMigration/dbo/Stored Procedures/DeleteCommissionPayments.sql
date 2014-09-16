CREATE PROCEDURE [dbo].[DeleteCommissionPayments]
    @InquiryNumber nvarchar(50),
    @TransactionID nvarchar(50),
    @CommissionPaymentNumber int
AS
Begin
 Delete [dbo].[CommissionPayments] where     [InquiryNumber] = @InquiryNumber AND 
    [TransactionID] = @TransactionID AND 
    [CommissionPaymentNumber] = @CommissionPaymentNumber
End

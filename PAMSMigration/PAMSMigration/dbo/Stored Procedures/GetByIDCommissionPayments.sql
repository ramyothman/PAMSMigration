CREATE PROCEDURE [dbo].[GetByIDCommissionPayments]
    @InquiryNumber nvarchar(50),
    @TransactionID nvarchar(50),
    @CommissionPaymentNumber int
AS
BEGIN
Select CommissionPayments.* , Commissions.Paid
FROM         Commissions INNER JOIN
                      CommissionPayments ON Commissions.InquiryNumber = CommissionPayments.InquiryNumber
                      WHERE CommissionPayments.[InquiryNumber] = @InquiryNumber
 AND [TransactionID] = @TransactionID
 AND [CommissionPaymentNumber] = @CommissionPaymentNumber
--Select * From [dbo].[CommissionPayments]
--WHERE [InquiryNumber] = @InquiryNumber
-- AND [TransactionID] = @TransactionID
-- AND [CommissionPaymentNumber] = @CommissionPaymentNumber
END

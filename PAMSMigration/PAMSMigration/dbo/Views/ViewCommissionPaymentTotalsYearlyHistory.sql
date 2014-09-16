CREATE VIEW [dbo].[ViewCommissionPaymentTotalsYearlyHistory]
AS
SELECT     InquiryNumber, SUM(PaidCommissionAmount) AS PaidCommissionAmount, CommissionAmount
FROM         dbo.ViewSubCommissionPaymentsYearlyHistory
GROUP BY InquiryNumber, CommissionAmount

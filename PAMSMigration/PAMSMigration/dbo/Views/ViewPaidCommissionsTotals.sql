CREATE VIEW [dbo].[ViewPaidCommissionsTotals]
AS
SELECT        InquiryNumber, SUM(PaidCommissionAmountInEuro) AS PaidCommissionInEuro, IsPaid
FROM            dbo.CommissionPayments
WHERE        (IsPaid = 1)
GROUP BY InquiryNumber, IsPaid

CREATE VIEW [dbo].[ViewSubCommissionPaymentsYearlyHistory]
AS
SELECT     dbo.CommissionsYearlyHistory.InquiryNumber, CASE WHEN SUM(dbo.CommissionPaymentsYearlyHistory.PaidCommissionAmountInEuro) IS NULL 
                      THEN 0 ELSE SUM(dbo.CommissionPaymentsYearlyHistory.PaidCommissionAmountInEuro) END AS PaidCommissionAmount, 
                      dbo.CommissionsYearlyHistory.CommissionAmountInEuro AS CommissionAmount, 
                      dbo.CommissionPaymentsYearlyHistory.ONDate AS CommissionPaymentDate
FROM         dbo.CommissionPaymentsYearlyHistory RIGHT OUTER JOIN
                      dbo.CommissionsYearlyHistory ON dbo.CommissionPaymentsYearlyHistory.InquiryNumber = dbo.CommissionsYearlyHistory.InquiryNumber
GROUP BY dbo.CommissionsYearlyHistory.InquiryNumber, dbo.CommissionsYearlyHistory.CommissionAmountInEuro, dbo.CommissionPaymentsYearlyHistory.ONDate

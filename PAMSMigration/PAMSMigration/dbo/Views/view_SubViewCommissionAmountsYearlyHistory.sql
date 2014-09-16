CREATE VIEW [dbo].[view_SubViewCommissionAmountsYearlyHistory]
AS
SELECT     InquiryNumber, CommissionAmount, PaidCommissionAmount, CommissionAmount - PaidCommissionAmount AS RemainingCommissionAmount
FROM         dbo.ViewCommissionPaymentTotalsYearlyHistory

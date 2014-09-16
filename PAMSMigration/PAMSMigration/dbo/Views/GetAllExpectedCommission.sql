create view [dbo].[GetAllExpectedCommission]
as 
SELECT     PaidAmountCurrencyID, SUM(AmountInEuro) AS AmountInEuro, SUM(Amount) AS Amount, year, month
FROM         (
                       SELECT     dbo.Commissions.CurrencyID as PaidAmountCurrencyID , dbo.Commissions.CommissionAmountInEuro -
                                                 (SELECT     ISNULL(SUM(PaidCommissionAmountInEuro), 0) AS Expr1
                                                   FROM          dbo.CommissionPayments
                                                   WHERE      (InquiryNumber = dbo.Commissions.InquiryNumber)) AS AmountInEuro, dbo.Commissions.CommissionAmount -
                                                 (SELECT     ISNULL(SUM(PaidCommissionAmount), 0) AS Expr1
                                                   FROM          dbo.CommissionPayments
                                                   WHERE      (InquiryNumber = dbo.Commissions.InquiryNumber)) AS Amount, YEAR(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS year, 
                                             MONTH(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS month
                       FROM         dbo.Commissions INNER JOIN
                                             dbo.Orders ON dbo.Commissions.InquiryNumber = dbo.Orders.InquiryNumber
                       WHERE     (dbo.Orders.Delivered = 0)) AS Comm
GROUP BY PaidAmountCurrencyID, year, month

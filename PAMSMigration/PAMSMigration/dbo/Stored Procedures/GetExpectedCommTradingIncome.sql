CREATE procedure [dbo].[GetExpectedCommTradingIncome] (
 @DaysNo int = 30 ,
 @year int,
 @month int )
 as 
SELECT   -- SUM(Amount) AS Amount, PaidAmountCurrencyID,
    SUM(AmountInEuro) AS AmountInEuro,  year, month
FROM         (SELECT     dbo.CustomerPayments.PaidAmountCurrencyID, dbo.Orders.PriceInEuro - dbo.CustomerPayments.PaidAmountInEuro AS AmountInEuro, 
                                              dbo.Orders.Price - dbo.CustomerPayments.PaidAmount AS Amount, YEAR(DATEADD(day, @DaysNo, dbo.Orders.ExpansionDeliveryDate)) AS year, 
                                              MONTH(DATEADD(day, @DaysNo, dbo.Orders.ExpansionDeliveryDate)) AS month
                       FROM          dbo.CustomerPayments INNER JOIN
                                              dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                                              dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber
                       WHERE      (dbo.Inquiries.SupplierID = 12) AND (dbo.Orders.Delivered = 0)
                       UNION
                       SELECT     dbo.Commissions.CurrencyID, dbo.Commissions.CommissionAmountInEuro -
                                                 (SELECT     ISNULL(SUM(PaidCommissionAmountInEuro), 0) AS Expr1
                                                   FROM          dbo.CommissionPayments
                                                   WHERE      (InquiryNumber = dbo.Commissions.InquiryNumber)) AS AmountInEuro, dbo.Commissions.CommissionAmount -
                                                 (SELECT     ISNULL(SUM(PaidCommissionAmount), 0) AS Expr1
                                                   FROM          dbo.CommissionPayments
                                                   WHERE      (InquiryNumber = dbo.Commissions.InquiryNumber)) AS Amount, YEAR(DATEADD(day, @DaysNo, dbo.Orders.ExpansionDeliveryDate)) AS year, 
                                             MONTH(DATEADD(day, @DaysNo, dbo.Orders.ExpansionDeliveryDate)) AS month
                       FROM         dbo.Commissions INNER JOIN
                                             dbo.Orders ON dbo.Commissions.InquiryNumber = dbo.Orders.InquiryNumber
                       WHERE     (dbo.Orders.Delivered = 0)) AS Comm
                       
                       where  (Comm.year = @year and month >= @month ) or (  Comm.year > @year)
                       
                       
GROUP BY PaidAmountCurrencyID, year, month

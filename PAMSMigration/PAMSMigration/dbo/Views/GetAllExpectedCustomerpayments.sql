create view [dbo].[GetAllExpectedCustomerpayments]
as 
SELECT     PaidAmountCurrencyID, SUM(AmountInEuro) AS AmountInEuro, SUM(Amount) AS Amount, year, month
FROM         (SELECT     dbo.CustomerPayments.PaidAmountCurrencyID, dbo.Orders.PriceInEuro - dbo.CustomerPayments.PaidAmountInEuro AS AmountInEuro, 
                                              dbo.Orders.Price - dbo.CustomerPayments.PaidAmount AS Amount, YEAR(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS year, 
                                              MONTH(DATEADD(day, 30, dbo.Orders.ExpansionDeliveryDate)) AS month
                       FROM          dbo.CustomerPayments INNER JOIN
                                              dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                                              dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber
                       WHERE      (dbo.Inquiries.SupplierID = 12) AND (dbo.Orders.Delivered = 0)
                     ) AS Comm
GROUP BY PaidAmountCurrencyID, year, month

CREATE view [dbo].[GetAllExpectedIncome]  as
select PaidAmountCurrencyID ,SUM( AmountInEuro ) as AmountInEuro , sum(Amount) as Amount , year , month 
from (
SELECT     CustomerPayments.PaidAmountCurrencyID,Orders.PriceInEuro- CustomerPayments.PaidAmountInEuro AmountInEuro, 
Orders.Price - CustomerPayments.PaidAmount as Amount , year(DATEADD(day,30, Orders.ExpansionDeliveryDate )) year  ,
month(DATEADD(day,30, Orders.ExpansionDeliveryDate )) month 
FROM         CustomerPayments INNER JOIN
                      Inquiries ON CustomerPayments.InquiryNumber = Inquiries.InquiryNumber INNER JOIN
                      Orders ON Inquiries.InquiryNumber = Orders.InquiryNumber
WHERE     (Inquiries.SupplierID = 12) AND (Orders.Delivered = 0)
union
SELECT  Commissions.CurrencyID,    Commissions.CommissionAmountInEuro   - (select ISNULL(SUM(  CommissionPayments.PaidCommissionAmountInEuro ) 
, 0)   from CommissionPayments where CommissionPayments.InquiryNumber = Commissions.InquiryNumber ) AmountInEuro
,Commissions.CommissionAmount  - (select ISNULL(SUM(  CommissionPayments.PaidCommissionAmount ) 
, 0)   from CommissionPayments where CommissionPayments.InquiryNumber = Commissions.InquiryNumber ) Amount, YEAR(DATEADD(day,30, Orders.ExpansionDeliveryDate )) year,
month(DATEADD(day,30, Orders.ExpansionDeliveryDate )) month
                    
FROM         Commissions INNER JOIN
                      Orders ON Commissions.InquiryNumber = Orders.InquiryNumber
WHERE     (Orders.Delivered = 0)
) as Comm
group by PaidAmountCurrencyID ,year , month

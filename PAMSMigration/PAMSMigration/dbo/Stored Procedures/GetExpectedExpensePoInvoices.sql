Create procedure [dbo].[GetExpectedExpensePoInvoices] (
 @DaysNo int = 30 ,
 @year int,
 @month int )
 as 
SELECT   -- SUM(Amount) AS Amount, PaidAmountCurrencyID,
    SUM(RequiredPaidValueInEuro) AS AmountInEuro,  year, month
FROM         (SELECT     RequiredPaidValueInEuro,  IsPaid, YEAR( InvoiceDate) as year , MONTH(InvoiceDate)as month
FROM         PruchaseOrderInvoices
WHERE     (IsPaid = 0)) AS Comm
                       
                       where  (Comm.year = @year and month >= @month ) or (  Comm.year > @year)
                       
                       
GROUP BY  year, month

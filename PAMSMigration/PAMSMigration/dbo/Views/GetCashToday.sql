CREATE view [dbo].[GetCashToday]
as 
select PaymentName ,  sum(Income) - SUM (Expense) as today  , SUM( Recievables ) as Recievables  ,  sum(Payables ) as Payables
from 
(SELECT   case when  IsIn ='true' then Journals.AmountInEuro else 0 end as InCome ,case when  IsIn ='false' then Journals.AmountInEuro else 0 end as Expense , PaymentAccountType.Name AS PaymentName 
,IsIn
, 0 as Recievables  , 0 as Payables                     
FROM         Journals INNER JOIN
                      PaymentAccountType ON Journals.PaymentAccountTypeID = PaymentAccountType.PaymentAccountTypeID INNER JOIN
                      Expenses ON Journals.ExpenseID = Expenses.ExpenseID INNER JOIN
                      ExpenseType ON Expenses.ExpenseTypeID = ExpenseType.ExpenseTypeID
                      
                      where Journals.Date <=  CAST(GETDATE() AS DATE)
                      
union 
SELECT   0 ,0, 'Today' AS PaymentName
,IsIn , case when  IsIn ='true' then Journals.AmountInEuro else 0 end  , case when  IsIn ='false' then Journals.AmountInEuro else 0 end 
                     
FROM         Journals INNER JOIN
                      PaymentAccountType ON Journals.PaymentAccountTypeID = PaymentAccountType.PaymentAccountTypeID INNER JOIN
                      Expenses ON Journals.ExpenseID = Expenses.ExpenseID INNER JOIN
                      ExpenseType ON Expenses.ExpenseTypeID = ExpenseType.ExpenseTypeID
                      
                      where CONVERT(datetime,  Journals.Date , 103) = CAST(GETDATE() AS DATE)
                      
                      
                      
                      
                      ) as t
                      
                      
                      group by PaymentName

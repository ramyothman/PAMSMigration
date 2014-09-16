CREATE view [dbo].[GetAllExpensesFromJournals]
as
SELECT     SUM(CreditValue) AS Value, CurrencyID, SUM(AmountInEuro) AS AmountInEuro, MONTH(Date) AS month, YEAR(Date) AS year
FROM         Journals
WHERE     (CreditValue > 0)
GROUP BY CurrencyID, MONTH(Date), YEAR(Date)

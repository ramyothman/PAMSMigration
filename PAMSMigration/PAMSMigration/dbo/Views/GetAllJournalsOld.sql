CREATE VIEW [dbo].[GetAllJournalsOld]
AS
SELECT     dbo.Journals.JournalID, dbo.Journals.DebitValue, dbo.Journals.CreditValue, dbo.Journals.ExpenseID, dbo.Journals.Date, dbo.Journals.Notes, 
                      dbo.Journals.CurrencyID, dbo.Journals.RateToEuro, dbo.Journals.AmountInEuro, dbo.Journals.PaymentAccountTypeID, ISNULL(dbo.ExpenseType.IsIn, 0) AS IsIn, 
                      CASE WHEN ISNULL(dbo.ExpenseType.IsIn, 0) = 0 THEN 'Expennse' ELSE 'Income' END AS Type, dbo.Journals.EmployeeID, dbo.Journals.BankID
FROM         dbo.Journals INNER JOIN
                      dbo.Expenses ON dbo.Journals.ExpenseID = dbo.Expenses.ExpenseID INNER JOIN
                      dbo.ExpenseType ON dbo.Expenses.ExpenseTypeID = dbo.ExpenseType.ExpenseTypeID

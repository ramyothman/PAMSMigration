CREATE VIEW [dbo].[GetAllExpenses]
AS
SELECT     dbo.Expenses.ExpenseID, dbo.Expenses.Name, dbo.Expenses.IsFixed, dbo.Expenses.ExpenseTypeID, dbo.Expenses.PeriodTypeID, dbo.Expenses.RepeatationNo, 
                      dbo.Expenses.StartDate, dbo.Expenses.EndDate, dbo.Expenses.Value, dbo.Expenses.CurrencyID, dbo.Expenses.EmployeeID, ISNULL(dbo.ExpenseType.IsIn, 0) 
                      AS IsIn, CASE WHEN ISNULL(dbo.ExpenseType.IsIn, 0) = 0 THEN 'Expennse' ELSE 'Income' END AS Type
FROM         dbo.Expenses INNER JOIN
                      dbo.ExpenseType ON dbo.Expenses.ExpenseTypeID = dbo.ExpenseType.ExpenseTypeID

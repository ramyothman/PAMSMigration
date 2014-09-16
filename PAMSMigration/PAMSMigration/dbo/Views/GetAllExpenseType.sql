CREATE VIEW [dbo].[GetAllExpenseType]
AS
SELECT     ExpenseTypeID, Name, IsIn, CASE WHEN isnull(IsIn, 0) = 0 THEN 'Expense' ELSE 'Income' END AS IsInValue
FROM         dbo.ExpenseType

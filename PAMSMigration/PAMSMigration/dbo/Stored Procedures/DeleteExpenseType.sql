CREATE PROCEDURE [dbo].[DeleteExpenseType]
    @ExpenseTypeID int
AS
Begin
 Delete [dbo].[ExpenseType] where     [ExpenseTypeID] = @ExpenseTypeID
End

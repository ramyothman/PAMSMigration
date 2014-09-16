CREATE PROCEDURE [dbo].[DeleteExpenses]
    @ExpenseID int
AS
Begin
 Delete [dbo].[Expenses] where     [ExpenseID] = @ExpenseID
End

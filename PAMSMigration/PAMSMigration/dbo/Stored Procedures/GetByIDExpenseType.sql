CREATE PROCEDURE [dbo].[GetByIDExpenseType]
    @ExpenseTypeID int
AS
BEGIN
Select ExpenseTypeID, Name,IsIn
From [dbo].[ExpenseType]
WHERE [ExpenseTypeID] = @ExpenseTypeID
END

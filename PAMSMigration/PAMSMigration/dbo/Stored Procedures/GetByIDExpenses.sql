CREATE PROCEDURE [dbo].[GetByIDExpenses]
    @ExpenseID int
AS
BEGIN
--Select ExpenseID, Name, IsFixed, ExpenseTypeID, PeriodTypeID, RepeatationNo, StartDate, EndDate, Value, CurrencyID
Select *
From [dbo].[Expenses]
WHERE [ExpenseID] = @ExpenseID
END

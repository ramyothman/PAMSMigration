CREATE PROCEDURE [dbo].[InsertNewExpenses]
   
    @Name nvarchar(Max),
    @IsFixed bit,
    @ExpenseTypeID int,
    @PeriodTypeID int,
    @RepeatationNo int,
    @StartDate datetime,
    @EndDate datetime,
    @Value decimal(12,2),
    @CurrencyID int,
    @EmployeeID int
AS
INSERT INTO [dbo].[Expenses] (
  
    [Name],
    [IsFixed],
    [ExpenseTypeID],
    [PeriodTypeID],
    [RepeatationNo],
    [StartDate],
    [EndDate],
    [Value],
    [CurrencyID],
    [EmployeeID])
Values (
    @Name,
    @IsFixed,
    @ExpenseTypeID,
    @PeriodTypeID,
    @RepeatationNo,
    @StartDate,
    @EndDate,
    @Value,
    @CurrencyID,
    @EmployeeID)
IF @@ROWCOUNT > 0
Select * from Expenses
Where [ExpenseID] = @@IDENTITY

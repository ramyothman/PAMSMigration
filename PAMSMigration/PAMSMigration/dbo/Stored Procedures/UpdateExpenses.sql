CREATE PROCEDURE [dbo].[UpdateExpenses]
 
    @OldExpenseID int,
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
UPDATE [dbo].[Expenses]
SET
  
    Name = @Name,
    IsFixed = @IsFixed,
    ExpenseTypeID = @ExpenseTypeID,
    PeriodTypeID = @PeriodTypeID,
    RepeatationNo = @RepeatationNo,
    StartDate = @StartDate,
    EndDate = @EndDate,
    Value = @Value,
    CurrencyID = @CurrencyID,
    EmployeeID=@EmployeeID
WHERE [ExpenseID] = @OLDExpenseID
IF @@ROWCOUNT > 0
Select * From Expenses 
Where [ExpenseID] = @OldExpenseID

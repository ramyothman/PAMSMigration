CREATE PROCEDURE [dbo].[UpdateExpenseType]
    @OldExpenseTypeID int,
    @Name nvarchar(Max),
    @IsIn bit
AS
UPDATE [dbo].[ExpenseType]
SET
    Name = @Name ,
    IsIn = @IsIn
WHERE [ExpenseTypeID] = @OLDExpenseTypeID
IF @@ROWCOUNT > 0
Select * From ExpenseType 
Where [ExpenseTypeID] = @OLDExpenseTypeID

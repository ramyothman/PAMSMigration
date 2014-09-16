CREATE PROCEDURE [dbo].[InsertNewExpenseType]
(
    @Name nvarchar(Max),
    @IsIn bit
    )
AS
INSERT INTO [dbo].[ExpenseType] (
    [Name] , [IsIn]
    )
Values (
    @Name , @IsIn )
IF @@ROWCOUNT > 0
Select * from ExpenseType
Where [ExpenseTypeID] = @@identity

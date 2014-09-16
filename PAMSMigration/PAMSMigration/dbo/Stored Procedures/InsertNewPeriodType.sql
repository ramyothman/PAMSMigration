CREATE PROCEDURE [dbo].[InsertNewPeriodType]
   
    @Name nvarchar(MAX),
    @DaysNo int
AS
INSERT INTO [dbo].[PeriodType] (
    
    [Name],
    [DaysNo])
Values (
    
    @Name,
    @DaysNo)
IF @@ROWCOUNT > 0
Select * from PeriodType
Where [PeriodTypeID] = @@identity

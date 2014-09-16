CREATE PROCEDURE [dbo].[InsertNewTimePeriod]
    @PeriodDays int,
    @PeriodName nvarchar(50),
    @TimePeriodID int
AS
INSERT INTO [dbo].[TimePeriod] (
    [PeriodDays],
    [PeriodName],
    [TimePeriodID])
Values (
    @PeriodDays,
    @PeriodName,
    @TimePeriodID)
IF @@ROWCOUNT > 0
Select * from TimePeriod
Where [TimePeriodID] = @TimePeriodID

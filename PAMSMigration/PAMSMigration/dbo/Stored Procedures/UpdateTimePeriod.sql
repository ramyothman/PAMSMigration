CREATE PROCEDURE [dbo].[UpdateTimePeriod]
    @PeriodDays int,
    @PeriodName nvarchar(50),
    @TimePeriodID int,
    @OldTimePeriodID int
AS
UPDATE [dbo].[TimePeriod]
SET
    PeriodDays = @PeriodDays,
    PeriodName = @PeriodName,
    TimePeriodID = @TimePeriodID
WHERE [TimePeriodID] = @OLDTimePeriodID
IF @@ROWCOUNT > 0
Select * From TimePeriod 
Where [TimePeriodID] = @TimePeriodID

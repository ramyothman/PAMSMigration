CREATE PROCEDURE [dbo].[GetByIDTimePeriod]
    @TimePeriodID int
AS
BEGIN
Select PeriodDays, PeriodName, TimePeriodID
From [dbo].[TimePeriod]
WHERE [TimePeriodID] = @TimePeriodID
END

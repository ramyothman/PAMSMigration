CREATE PROCEDURE [dbo].[DeleteTimePeriod]
    @TimePeriodID int
AS
Begin
 Delete [dbo].[TimePeriod] where     [TimePeriodID] = @TimePeriodID
End

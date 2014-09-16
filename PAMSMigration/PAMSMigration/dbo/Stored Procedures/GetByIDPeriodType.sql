CREATE PROCEDURE [dbo].[GetByIDPeriodType]
    @PeriodTypeID int
AS
BEGIN
Select PeriodTypeID, Name, DaysNo
From [dbo].[PeriodType]
WHERE [PeriodTypeID] = @PeriodTypeID
END

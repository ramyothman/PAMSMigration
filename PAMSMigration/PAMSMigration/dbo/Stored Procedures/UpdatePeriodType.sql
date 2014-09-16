CREATE PROCEDURE [dbo].[UpdatePeriodType]
    @OldPeriodTypeID int,
    @Name nvarchar(MAX),
    @DaysNo int
AS
UPDATE [dbo].[PeriodType]
SET
    Name = @Name,
    DaysNo = @DaysNo
WHERE [PeriodTypeID] = @OLDPeriodTypeID
IF @@ROWCOUNT > 0
Select * From PeriodType 
Where [PeriodTypeID] = @OldPeriodTypeID

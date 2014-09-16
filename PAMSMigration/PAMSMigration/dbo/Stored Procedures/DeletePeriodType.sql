CREATE PROCEDURE [dbo].[DeletePeriodType]
    @PeriodTypeID int
AS
Begin
 Delete [dbo].[PeriodType] where     [PeriodTypeID] = @PeriodTypeID 
End

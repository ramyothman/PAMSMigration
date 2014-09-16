CREATE PROCEDURE [dbo].[DeleteVacationReportWay]
    @ID int
AS
Begin
 Delete [dbo].[VacationReportWay] where     [ID] = @ID
End

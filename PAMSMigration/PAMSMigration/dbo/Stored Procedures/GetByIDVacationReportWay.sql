CREATE PROCEDURE [dbo].[GetByIDVacationReportWay]
    @ID int
AS
Begin
 select * from  [dbo].[VacationReportWay] where     [ID] = @ID
End

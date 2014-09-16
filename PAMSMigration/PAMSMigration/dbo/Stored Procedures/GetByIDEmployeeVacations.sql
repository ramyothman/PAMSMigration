CREATE PROCEDURE [dbo].[GetByIDEmployeeVacations]
    @EmployeeVacationID int
AS
Begin
 select * from  [dbo].[EmployeeVacations] where     [EmployeeVacationID] = @EmployeeVacationID
End

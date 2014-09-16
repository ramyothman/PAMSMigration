CREATE PROCEDURE [dbo].[DeleteEmployeeVacations]
    @EmployeeVacationID int
AS
Begin
 Delete [dbo].[EmployeeVacations] where     [EmployeeVacationID] = @EmployeeVacationID
End

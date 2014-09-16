CREATE PROCEDURE [dbo].[DeleteEmployees]
    @EmployeeID int
AS
Begin
 Delete [dbo].[Employees] where     [EmployeeID] = @EmployeeID
End

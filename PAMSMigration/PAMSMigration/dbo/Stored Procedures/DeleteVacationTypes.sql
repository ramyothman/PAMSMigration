CREATE PROCEDURE [dbo].[DeleteVacationTypes]
    @VacationTypeID int
AS
Begin
 Delete [dbo].[VacationTypes] where     [VacationTypeID] = @VacationTypeID
End

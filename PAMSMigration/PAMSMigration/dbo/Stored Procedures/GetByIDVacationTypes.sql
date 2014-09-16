CREATE PROCEDURE [dbo].[GetByIDVacationTypes]
    @VacationTypeID int
AS
Begin
 select * from  [dbo].[VacationTypes] where     [VacationTypeID] = @VacationTypeID
End

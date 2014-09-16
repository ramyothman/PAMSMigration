CREATE PROCEDURE [dbo].[DeletePersonYearlyVacations]
    @ID int
   
AS
Begin
 Delete [dbo].[PersonYearlyVacations] where     [ID] = @ID 
End

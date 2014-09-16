CREATE  PROCEDURE [dbo].[DeletePersonInternship]
    @PersonInternshipId int
AS
Begin
 Delete [Person].[PersonInternship] where     [PersonInternshipId] = @PersonInternshipId
End

CREATE  PROCEDURE [dbo].[DeletePersonEducation]
    @PersonEducationId int
AS
Begin
 Delete [Person].[PersonEducation] where     [PersonEducationId] = @PersonEducationId
End

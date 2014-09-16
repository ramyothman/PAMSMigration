CREATE  PROCEDURE [dbo].[DeletePersonWorkExperience]
    @PersonWorkExperienceId int
AS
Begin
 Delete [Person].[PersonWorkExperience] where     [PersonWorkExperienceId] = @PersonWorkExperienceId
End

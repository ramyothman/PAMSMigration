CREATE  PROCEDURE [dbo].[GetByIDPersonWorkExperience]
    @PersonWorkExperienceId int
AS
BEGIN
Select *
From [Person].[PersonWorkExperience]
WHERE [PersonWorkExperienceId] = @PersonWorkExperienceId
END

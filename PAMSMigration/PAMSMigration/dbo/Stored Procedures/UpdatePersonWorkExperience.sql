CREATE  PROCEDURE [dbo].[UpdatePersonWorkExperience]
    @OldPersonWorkExperienceId int,
    @PersonId int,
    @Employer nvarchar(150),
    @PositionHeld nvarchar(150),
    @Responsibilities ntext,
    @StartDate datetime,
    @EndDate datetime
AS
UPDATE [Person].[PersonWorkExperience]
SET
    PersonId = @PersonId,
    Employer = @Employer,
    PositionHeld = @PositionHeld,
    Responsibilities = @Responsibilities,
    StartDate = @StartDate,
    EndDate = @EndDate
WHERE [PersonWorkExperienceId] = @OLDPersonWorkExperienceId
IF @@ROWCOUNT > 0
Select * From Person.PersonWorkExperience 
Where [PersonWorkExperienceId] = @OLDPersonWorkExperienceId

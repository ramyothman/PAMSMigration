CREATE  PROCEDURE [dbo].[InsertNewPersonWorkExperience]
    @PersonWorkExperienceId int output ,
    @PersonId int,
    @Employer nvarchar(150),
    @PositionHeld nvarchar(150),
    @Responsibilities ntext,
    @StartDate datetime,
    @EndDate datetime
AS
INSERT INTO [Person].[PersonWorkExperience] (
    [PersonId],
    [Employer],
    [PositionHeld],
    [Responsibilities],
    [StartDate],
    [EndDate])
Values (
    @PersonId,
    @Employer,
    @PositionHeld,
    @Responsibilities,
    @StartDate,
    @EndDate)
Set @PersonWorkExperienceId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonWorkExperience
Where [PersonWorkExperienceId] = @@identity

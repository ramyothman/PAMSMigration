CREATE  PROCEDURE [dbo].[InsertNewPersonEducation]
    @PersonEducationId int output ,
    @PersonId int,
    @InstitutionName nvarchar(50),
    @Degree nvarchar(50),
    @StartDate datetime,
    @GraduationDate datetime,
    @FinalGrade nvarchar(50),
    @EducationTypeID int
AS
INSERT INTO [Person].[PersonEducation] (
    [PersonId],
    [InstitutionName],
    [Degree],
    [StartDate],
    [GraduationDate],
    [FinalGrade],
    [EducationTypeID])
Values (
    @PersonId,
    @InstitutionName,
    @Degree,
    @StartDate,
    @GraduationDate,
    @FinalGrade,
    @EducationTypeID)
Set @PersonEducationId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonEducation
Where [PersonEducationId] = @@identity

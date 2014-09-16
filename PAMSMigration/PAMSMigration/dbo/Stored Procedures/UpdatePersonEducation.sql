CREATE  PROCEDURE [dbo].[UpdatePersonEducation]
    @OldPersonEducationId int,
    @PersonId int,
    @InstitutionName nvarchar(50),
    @Degree nvarchar(50),
    @StartDate datetime,
    @GraduationDate datetime,
    @FinalGrade nvarchar(50),
    @EducationTypeID int
AS
UPDATE [Person].[PersonEducation]
SET
    PersonId = @PersonId,
    InstitutionName = @InstitutionName,
    Degree = @Degree,
    StartDate = @StartDate,
    GraduationDate = @GraduationDate,
    FinalGrade = @FinalGrade,
    EducationTypeID = @EducationTypeID
WHERE [PersonEducationId] = @OLDPersonEducationId
IF @@ROWCOUNT > 0
Select * From Person.PersonEducation 
Where [PersonEducationId] = @OLDPersonEducationId

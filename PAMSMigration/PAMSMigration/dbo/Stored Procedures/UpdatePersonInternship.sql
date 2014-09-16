CREATE  PROCEDURE [dbo].[UpdatePersonInternship]
    @OldPersonInternshipId int,
    @PersonId int,
    @Service nvarchar(50),
    @Institution nvarchar(150),
    @Evaluation nvarchar(50),
    @StartDate datetime,
    @EndDate datetime
AS
UPDATE [Person].[PersonInternship]
SET
    PersonId = @PersonId,
    Service = @Service,
    Institution = @Institution,
    Evaluation = @Evaluation,
    StartDate = @StartDate,
    EndDate = @EndDate
WHERE [PersonInternshipId] = @OLDPersonInternshipId
IF @@ROWCOUNT > 0
Select * From Person.PersonInternship 
Where [PersonInternshipId] = @OLDPersonInternshipId

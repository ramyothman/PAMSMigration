CREATE  PROCEDURE [dbo].[InsertNewPersonInternship]
    @PersonInternshipId int output ,
    @PersonId int,
    @Service nvarchar(50),
    @Institution nvarchar(150),
    @Evaluation nvarchar(50),
    @StartDate datetime,
    @EndDate datetime
AS
INSERT INTO [Person].[PersonInternship] (
    [PersonId],
    [Service],
    [Institution],
    [Evaluation],
    [StartDate],
    [EndDate])
Values (
    @PersonId,
    @Service,
    @Institution,
    @Evaluation,
    @StartDate,
    @EndDate)
Set @PersonInternshipId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonInternship
Where [PersonInternshipId] = @@identity

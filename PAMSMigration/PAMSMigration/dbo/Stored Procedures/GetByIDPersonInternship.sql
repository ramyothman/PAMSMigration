CREATE  PROCEDURE [dbo].[GetByIDPersonInternship]
    @PersonInternshipId int
AS
BEGIN
Select *
From [Person].[PersonInternship]
WHERE [PersonInternshipId] = @PersonInternshipId
END

CREATE  PROCEDURE [dbo].[GetByIDPersonEducation]
    @PersonEducationId int
AS
BEGIN
Select *
From [Person].[PersonEducation]
WHERE [PersonEducationId] = @PersonEducationId
END

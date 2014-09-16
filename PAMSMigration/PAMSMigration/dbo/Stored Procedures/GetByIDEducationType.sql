CREATE PROCEDURE [dbo].[GetByIDEducationType]
    @EducationTypeId int
AS
BEGIN
SELECT *
  FROM [Person].[EducationType]
  WHERE [EducationTypeId] = @EducationTypeId
END

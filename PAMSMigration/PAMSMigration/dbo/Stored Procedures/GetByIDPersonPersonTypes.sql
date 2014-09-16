CREATE  PROCEDURE [dbo].[GetByIDPersonPersonTypes]
    @PersonPersonTypesId int
AS
BEGIN
Select *
From [Person].[PersonPersonTypes]
WHERE [PersonPersonTypesId] = @PersonPersonTypesId
END

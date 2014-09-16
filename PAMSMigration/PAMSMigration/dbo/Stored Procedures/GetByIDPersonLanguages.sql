CREATE  PROCEDURE [dbo].[GetByIDPersonLanguages]
    @PersonLanguageId int
AS
BEGIN
Select *
From [Person].[PersonLanguages]
WHERE [PersonLanguageId] = @PersonLanguageId
END

CREATE  PROCEDURE [dbo].[GetByIDPersonLanguageProficiency]
    @PersonLanguageProficiencyId int
AS
BEGIN
Select *
From [Person].[PersonLanguageProficiency]
WHERE [PersonLanguageProficiencyId] = @PersonLanguageProficiencyId
END

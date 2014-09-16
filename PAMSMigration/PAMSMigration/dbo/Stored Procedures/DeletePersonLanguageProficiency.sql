CREATE  PROCEDURE [dbo].[DeletePersonLanguageProficiency]
    @PersonLanguageProficiencyId int
AS
Begin
 Delete [Person].[PersonLanguageProficiency] where     [PersonLanguageProficiencyId] = @PersonLanguageProficiencyId
End

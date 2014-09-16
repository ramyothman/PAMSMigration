CREATE  PROCEDURE [dbo].[DeletePersonLanguages]
    @PersonLanguageId int
AS
Begin
 Delete [Person].[PersonLanguages] where     [PersonLanguageId] = @PersonLanguageId
End

CREATE  PROCEDURE [dbo].[UpdatePersonLanguages]
    @OldPersonLanguageId int,
    @PersonId int,
    @LanguageId int,
    @Title nvarchar(8),
    @FirstName nvarchar(50),
    @MiddleName nvarchar(50),
    @LastName nvarchar(50),
    @Suffix nvarchar(60),
    @DisplayName nvarchar(250),
    @AcronymName nvarchar(5)
AS
UPDATE [Person].[PersonLanguages]
SET
    PersonId = @PersonId,
    LanguageId = @LanguageId,
    Title = @Title,
    FirstName = @FirstName,
    MiddleName = @MiddleName,
    LastName = @LastName,
    Suffix = @Suffix,
    DisplayName = @DisplayName ,
    AcronymName = @AcronymName
WHERE [PersonLanguageId] = @OLDPersonLanguageId
IF @@ROWCOUNT > 0
Select * From Person.PersonLanguages 
Where [PersonLanguageId] = @OLDPersonLanguageId

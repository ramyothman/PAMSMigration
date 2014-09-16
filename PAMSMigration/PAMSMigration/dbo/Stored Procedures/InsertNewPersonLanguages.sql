CREATE  PROCEDURE [dbo].[InsertNewPersonLanguages]
    @PersonLanguageId int output ,
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
INSERT INTO [Person].[PersonLanguages] (
    [PersonId],
    [LanguageId],
    [Title],
    [FirstName],
    [MiddleName],
    [LastName],
    [Suffix],
    [DisplayName] ,
    [AcronymName]
    )
Values (
    @PersonId,
    @LanguageId,
    @Title,
    @FirstName,
    @MiddleName,
    @LastName,
    @Suffix,
    @DisplayName ,
      @AcronymName )
Set @PersonLanguageId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonLanguages
Where [PersonLanguageId] = @@identity

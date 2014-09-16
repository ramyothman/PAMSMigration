CREATE  PROCEDURE [dbo].[InsertNewPersonPersonTypes]
    @PersonPersonTypesId int output ,
    @Name nvarchar(50),
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
AS
INSERT INTO [Person].[PersonPersonTypes] (
    [Name],
    [RowGuid],
    [ModifiedDate])
Values (
    @Name,
    @RowGuid,
    @ModifiedDate)
Set @PersonPersonTypesId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonPersonTypes
Where [PersonPersonTypesId] = @@identity

CREATE  PROCEDURE [dbo].[InsertNewPersonType]
    @PersonTypeId int output ,
    @BusinessEntityId int,
    @PersonPersonTypesId int,
    @ModifiedDate datetime
AS
INSERT INTO [Person].[PersonType] (
    [BusinessEntityId],
    [PersonPersonTypesId],
    [ModifiedDate])
Values (
    @BusinessEntityId,
    @PersonPersonTypesId,
    @ModifiedDate)
Set @PersonTypeId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonType
Where [PersonTypeId] = @@identity

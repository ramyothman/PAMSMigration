CREATE  PROCEDURE [dbo].[UpdatePersonType]
    @OldPersonTypeId int,
    @BusinessEntityId int,
    @PersonPersonTypesId int,
    @ModifiedDate datetime
AS
UPDATE [Person].[PersonType]
SET
    BusinessEntityId = @BusinessEntityId,
    PersonPersonTypesId = @PersonPersonTypesId,
    ModifiedDate = @ModifiedDate
WHERE [PersonTypeId] = @OLDPersonTypeId
IF @@ROWCOUNT > 0
Select * From Person.PersonType 
Where [PersonTypeId] = @OLDPersonTypeId

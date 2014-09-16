CREATE  PROCEDURE [dbo].[UpdatePerson]
    @BusinessEntityId int,
    @OldBusinessEntityId int,
    @NameStyle bit,
    @EmailPromotion int,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime,
    @CreatedDate datetime,
    @PersonImage nvarchar(250),
    @IsActive bit
AS
UPDATE [Person].[Person]
SET
    BusinessEntityId = @BusinessEntityId,
    NameStyle = @NameStyle,
    EmailPromotion = @EmailPromotion,
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate,
    CreatedDate = @CreatedDate,
    PersonImage = @PersonImage,
    IsActive = @IsActive
WHERE [BusinessEntityId] = @OLDBusinessEntityId
IF @@ROWCOUNT > 0
Select * From Person.Person 
Where [BusinessEntityId] = @BusinessEntityId

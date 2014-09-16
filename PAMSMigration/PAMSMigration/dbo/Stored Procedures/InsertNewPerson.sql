CREATE  PROCEDURE [dbo].[InsertNewPerson]
    @BusinessEntityId int,
    @NameStyle bit,
    @EmailPromotion int,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime,
    @CreatedDate datetime,
    @PersonImage nvarchar(250),
    @IsActive bit
AS
INSERT INTO [Person].[Person] (
    [BusinessEntityId],
    [NameStyle],
    [EmailPromotion],
    [RowGuid],
    [ModifiedDate],
    [CreatedDate],
    PersonImage,
    [IsActive])
Values (
    @BusinessEntityId,
    @NameStyle,
    @EmailPromotion,
    @RowGuid,
    @ModifiedDate,
    @CreatedDate,
    @PersonImage,
    @IsActive)
IF @@ROWCOUNT > 0
Select * from Person.Person
Where [BusinessEntityId] = @BusinessEntityId

CREATE PROCEDURE [dbo].[InsertNewBusinessEntity]
    @BusinessEntityId int output ,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
    AS
INSERT INTO [Person].[BusinessEntity] (
    [RowGuid],
    [ModifiedDate])
Values (
    @RowGuid,
    @ModifiedDate)
Set @BusinessEntityId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.BusinessEntity
Where [BusinessEntityId] = @@identity

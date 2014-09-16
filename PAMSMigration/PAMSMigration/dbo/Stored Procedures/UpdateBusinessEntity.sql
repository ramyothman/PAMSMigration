CREATE PROCEDURE [dbo].[UpdateBusinessEntity]
    @OldBusinessEntityId int,
    @RowGuid uniqueidentifier,
    @ModifiedDate datetime
AS
UPDATE [Person].[BusinessEntity]
SET
    RowGuid = @RowGuid,
    ModifiedDate = @ModifiedDate
WHERE [BusinessEntityId] = @OLDBusinessEntityId
IF @@ROWCOUNT > 0
Select * From Person.BusinessEntity 
Where [BusinessEntityId] = @OLDBusinessEntityId

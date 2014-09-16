CREATE PROCEDURE [dbo].[DeleteBusinessEntity]
    @BusinessEntityId int
AS
Begin
 Delete [Person].[BusinessEntity] where     [BusinessEntityId] = @BusinessEntityId
End

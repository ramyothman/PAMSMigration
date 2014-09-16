CREATE PROCEDURE [dbo].[DeleteCredential]
    @BusinessEntityId int
AS
Begin
 delete UserRoles where UserID = @BusinessEntityId
 Delete [Person].[Credential] where     [BusinessEntityId] = @BusinessEntityId
End

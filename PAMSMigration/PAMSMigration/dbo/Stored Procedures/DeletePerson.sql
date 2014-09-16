CREATE  PROCEDURE [dbo].[DeletePerson]
    @BusinessEntityId int
AS
Begin
 Delete [Person].[Person] where     [BusinessEntityId] = @BusinessEntityId
End

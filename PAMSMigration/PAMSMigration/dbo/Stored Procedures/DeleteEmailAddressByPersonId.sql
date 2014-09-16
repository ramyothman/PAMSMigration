CREATE  PROCEDURE [dbo].[DeleteEmailAddressByPersonId]
    @PersonId int
AS
Begin
 Delete [Person].[EmailAddress] where     BusinessEntityId = @PersonId
End

CREATE  PROCEDURE [dbo].[DeletePersonPhoneByPersonId]
    @PersonId int
AS
Begin
 Delete [Person].[PersonPhone] where     BusinessEntityId = @PersonId
End

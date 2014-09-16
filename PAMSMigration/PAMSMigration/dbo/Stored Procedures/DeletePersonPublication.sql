CREATE  PROCEDURE [dbo].[DeletePersonPublication]
    @PersonPublicationId int
AS
Begin
 Delete [Person].[PersonPublication] where     [PersonPublicationId] = @PersonPublicationId
End

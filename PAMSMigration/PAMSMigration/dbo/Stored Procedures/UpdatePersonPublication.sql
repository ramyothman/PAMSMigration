CREATE  PROCEDURE [dbo].[UpdatePersonPublication]
    @OldPersonPublicationId int,
    @PersonId int,
    @PublicationTitle nvarchar(350),
    @PublicationAbstract ntext,
    @PublicationAttachmentPath nvarchar(350)
AS
UPDATE [Person].[PersonPublication]
SET
    PersonId = @PersonId,
    PublicationTitle = @PublicationTitle,
    PublicationAbstract = @PublicationAbstract,
    PublicationAttachmentPath = @PublicationAttachmentPath
WHERE [PersonPublicationId] = @OLDPersonPublicationId
IF @@ROWCOUNT > 0
Select * From Person.PersonPublication 
Where [PersonPublicationId] = @OLDPersonPublicationId

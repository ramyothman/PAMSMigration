CREATE  PROCEDURE [dbo].[InsertNewPersonPublication]
    @PersonPublicationId int output ,
    @PersonId int,
    @PublicationTitle nvarchar(350),
    @PublicationAbstract ntext,
    @PublicationAttachmentPath nvarchar(350)
AS
INSERT INTO [Person].[PersonPublication] (
    [PersonId],
    [PublicationTitle],
    [PublicationAbstract],
    [PublicationAttachmentPath])
Values (
    @PersonId,
    @PublicationTitle,
    @PublicationAbstract,
    @PublicationAttachmentPath)
Set @PersonPublicationId = SCOPE_IDENTITY()
IF @@ROWCOUNT > 0
Select * from Person.PersonPublication
Where [PersonPublicationId] = @@identity

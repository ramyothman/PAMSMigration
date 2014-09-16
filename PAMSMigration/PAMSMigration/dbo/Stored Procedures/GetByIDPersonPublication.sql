CREATE  PROCEDURE [dbo].[GetByIDPersonPublication]
    @PersonPublicationId int
AS
BEGIN
Select *
From [Person].[PersonPublication]
WHERE [PersonPublicationId] = @PersonPublicationId
END

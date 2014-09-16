CREATE PROCEDURE [dbo].[GetByIDCredential]
    @BusinessEntityId int
AS
BEGIN
Select  * From [Person].[Credential]
WHERE [BusinessEntityId] = @BusinessEntityId
END

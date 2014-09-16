CREATE  PROCEDURE [dbo].[GetByPersonIDEmailAddress]
    @BusinessEntityId int
AS
BEGIN
Select * From [Person].[EmailAddress]
WHERE BusinessEntityId = @BusinessEntityId
END

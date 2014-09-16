CREATE  PROCEDURE [dbo].[GetByPersonIdPersonPhones]
    @BusinessEntityId int
AS
BEGIN
Select * From [Person].[PersonPhone]
WHERE BusinessEntityId = @BusinessEntityId
END

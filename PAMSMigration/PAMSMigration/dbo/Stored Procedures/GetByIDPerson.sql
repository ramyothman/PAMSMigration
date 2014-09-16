CREATE  PROCEDURE [dbo].[GetByIDPerson]
    @BusinessEntityId int
AS
BEGIN
Select * From [Person].[Person]
WHERE [BusinessEntityId] = @BusinessEntityId
END

CREATE PROCEDURE [dbo].[GetByIDBusinessEntity]
    @BusinessEntityId int
AS
BEGIN
Select *
From [Person].[BusinessEntity]
WHERE [BusinessEntityId] = @BusinessEntityId
END

CREATE VIEW [dbo].[GetAllBusinessEntity]
AS
SELECT     BusinessEntityId, RowGuid, ModifiedDate
FROM         Person.BusinessEntity

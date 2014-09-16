CREATE PROCEDURE [dbo].[GetByIDStructureAttributes]
    @AttributeID int
AS
BEGIN
Select AttributeID, AttributeName, ParentAttribute
From [dbo].[StructureAttributes]
WHERE [AttributeID] = @AttributeID
END

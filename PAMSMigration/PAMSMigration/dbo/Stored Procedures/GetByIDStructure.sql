CREATE PROCEDURE [dbo].[GetByIDStructure]
    @StructureID int
AS
BEGIN
Select StructureID, StructureTypeID, BusinessEntityID, AttributeID, AttributeValue, ViewTypeID
From [dbo].[Structure]
WHERE [StructureID] = @StructureID
END

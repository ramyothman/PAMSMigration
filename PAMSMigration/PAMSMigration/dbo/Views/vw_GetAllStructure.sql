Create VIEW [dbo].[vw_GetAllStructure]
AS
SELECT     dbo.Structure.*, dbo.StructureAttributes.AttributeName, dbo.StructureAttributes.ParentAttribute, dbo.StructureViewType.ViewTypeName, 
                      dbo.StructureType.StructureType
FROM         dbo.Structure INNER JOIN
                      dbo.StructureAttributes ON dbo.Structure.AttributeID = dbo.StructureAttributes.AttributeID INNER JOIN
                      dbo.StructureType ON dbo.Structure.StructureTypeID = dbo.StructureType.StructureTypeID INNER JOIN
                      dbo.StructureViewType ON dbo.Structure.ViewTypeID = dbo.StructureViewType.ViewTypeID

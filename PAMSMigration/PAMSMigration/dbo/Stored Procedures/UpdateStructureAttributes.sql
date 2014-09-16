CREATE PROCEDURE [dbo].[UpdateStructureAttributes]
    @OldAttributeID int,
    @AttributeName nvarchar(75),
    @ParentAttribute int
AS
UPDATE [dbo].[StructureAttributes]
SET
    AttributeName = @AttributeName,
    ParentAttribute = @ParentAttribute
WHERE [AttributeID] = @OLDAttributeID
IF @@ROWCOUNT > 0
Select * From StructureAttributes 
Where [AttributeID] = @OLDAttributeID

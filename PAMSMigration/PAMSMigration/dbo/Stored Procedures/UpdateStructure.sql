CREATE PROCEDURE [dbo].[UpdateStructure]
    @OldStructureID int,
    @StructureTypeID int,
    @BusinessEntityID int,
    @AttributeID int,
    @AttributeValue ntext,
    @ViewTypeID int
AS
UPDATE [dbo].[Structure]
SET
    StructureTypeID = @StructureTypeID,
    BusinessEntityID = @BusinessEntityID,
    AttributeID = @AttributeID,
    AttributeValue = @AttributeValue,
    ViewTypeID = @ViewTypeID
WHERE [StructureID] = @OLDStructureID
IF @@ROWCOUNT > 0
Select * From Structure 
Where [StructureID] = @OLDStructureID

CREATE PROCEDURE [dbo].[UpdatePivotStructure]
    @OldPivotStructureID int,
    @PersonID int,
    @Name nvarchar(50),
    @Description nvarchar(500),
    @StructureXML ntext
AS
UPDATE [dbo].[PivotStructure]
SET
    PersonID = @PersonID,
    Name = @Name,
    Description = @Description,
    StructureXML = @StructureXML
WHERE [PivotStructureID] = @OLDPivotStructureID
IF @@ROWCOUNT > 0
Select * From PivotStructure 
Where [PivotStructureID] = @OLDPivotStructureID

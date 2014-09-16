CREATE PROCEDURE [dbo].[GetByIDPivotStructure]
    @PivotStructureID int
AS
BEGIN
Select PivotStructureID, PersonID, Name, Description, StructureXML
From [dbo].[PivotStructure]
WHERE [PivotStructureID] = @PivotStructureID
END

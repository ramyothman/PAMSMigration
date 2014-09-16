CREATE PROCEDURE [dbo].[DeletePivotStructure]
    @PivotStructureID int
AS
Begin
 Delete [dbo].[PivotStructure] where     [PivotStructureID] = @PivotStructureID
End

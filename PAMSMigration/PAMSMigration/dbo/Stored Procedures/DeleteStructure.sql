CREATE PROCEDURE [dbo].[DeleteStructure]
    @StructureID int
AS
Begin
 Delete [dbo].[Structure] where     [StructureID] = @StructureID
End

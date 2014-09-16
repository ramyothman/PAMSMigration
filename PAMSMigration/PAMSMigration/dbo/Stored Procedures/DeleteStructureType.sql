CREATE PROCEDURE [dbo].[DeleteStructureType]
    @StructureTypeID int
AS
Begin
 Delete [dbo].[StructureType] where     [StructureTypeID] = @StructureTypeID
End

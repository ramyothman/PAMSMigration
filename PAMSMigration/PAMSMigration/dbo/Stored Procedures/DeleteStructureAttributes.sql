CREATE PROCEDURE [dbo].[DeleteStructureAttributes]
    @AttributeID int
AS
Begin
 Delete [dbo].[StructureAttributes] where     [AttributeID] = @AttributeID
End

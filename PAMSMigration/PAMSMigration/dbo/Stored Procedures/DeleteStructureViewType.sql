CREATE PROCEDURE [dbo].[DeleteStructureViewType]
    @ViewTypeID int
AS
Begin
 Delete [dbo].[StructureViewType] where     [ViewTypeID] = @ViewTypeID
End

CREATE PROCEDURE [dbo].[UpdateStructureViewType]
    @OldViewTypeID int,
    @ViewTypeName nvarchar(50)
AS
UPDATE [dbo].[StructureViewType]
SET
    ViewTypeName = @ViewTypeName
WHERE [ViewTypeID] = @OLDViewTypeID
IF @@ROWCOUNT > 0
Select * From StructureViewType 
Where [ViewTypeID] = @OLDViewTypeID

CREATE PROCEDURE [dbo].[GetByIDStructureViewType]
    @ViewTypeID int
AS
BEGIN
Select ViewTypeID, ViewTypeName
From [dbo].[StructureViewType]
WHERE [ViewTypeID] = @ViewTypeID
END

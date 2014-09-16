CREATE PROCEDURE [dbo].[InsertNewStructureViewType]
    @ViewTypeName nvarchar(50)
AS
INSERT INTO [dbo].[StructureViewType] (
    [ViewTypeName])
Values (
    @ViewTypeName)
IF @@ROWCOUNT > 0
Select * from StructureViewType
Where [ViewTypeID] = @@identity

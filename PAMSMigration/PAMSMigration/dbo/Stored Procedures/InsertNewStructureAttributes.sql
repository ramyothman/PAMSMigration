CREATE PROCEDURE [dbo].[InsertNewStructureAttributes]
    @AttributeName nvarchar(75),
    @ParentAttribute int
AS
INSERT INTO [dbo].[StructureAttributes] (
    [AttributeName],
    [ParentAttribute])
Values (
    @AttributeName,
    @ParentAttribute)
IF @@ROWCOUNT > 0
Select * from StructureAttributes
Where [AttributeID] = @@identity

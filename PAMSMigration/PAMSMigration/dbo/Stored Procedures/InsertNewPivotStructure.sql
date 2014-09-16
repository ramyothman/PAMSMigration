CREATE PROCEDURE [dbo].[InsertNewPivotStructure]
    @PersonID int,
    @Name nvarchar(50),
    @Description nvarchar(500),
    @StructureXML ntext
AS
INSERT INTO [dbo].[PivotStructure] (
    [PersonID],
    [Name],
    [Description],
    [StructureXML])
Values (
    @PersonID,
    @Name,
    @Description,
    @StructureXML)
IF @@ROWCOUNT > 0
Select * from PivotStructure
Where [PivotStructureID] = @@identity

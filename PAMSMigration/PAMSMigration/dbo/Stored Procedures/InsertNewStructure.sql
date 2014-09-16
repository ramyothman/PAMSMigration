CREATE PROCEDURE [dbo].[InsertNewStructure]
    @StructureTypeID int,
    @BusinessEntityID int,
    @AttributeID int,
    @AttributeValue ntext,
    @ViewTypeID int
AS
INSERT INTO [dbo].[Structure] (
    [StructureTypeID],
    [BusinessEntityID],
    [AttributeID],
    [AttributeValue],
    [ViewTypeID])
Values (
    @StructureTypeID,
    @BusinessEntityID,
    @AttributeID,
    @AttributeValue,
    @ViewTypeID)
IF @@ROWCOUNT > 0
Select * from Structure
Where [StructureID] = @@identity

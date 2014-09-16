CREATE PROCEDURE [dbo].[InsertNewStructureType]
    @StructureType nvarchar(50)
AS
INSERT INTO [dbo].[StructureType] (
    [StructureType])
Values (
    @StructureType)
IF @@ROWCOUNT > 0
Select * from StructureType
Where [StructureTypeID] = @@identity

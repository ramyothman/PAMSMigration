CREATE PROCEDURE [dbo].[UpdateStructureType]
    @OldStructureTypeID int,
    @StructureType nvarchar(50)
AS
UPDATE [dbo].[StructureType]
SET
    StructureType = @StructureType
WHERE [StructureTypeID] = @OLDStructureTypeID
IF @@ROWCOUNT > 0
Select * From StructureType 
Where [StructureTypeID] = @OLDStructureTypeID

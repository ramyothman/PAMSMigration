CREATE PROCEDURE [dbo].[GetByIDStructureType]
    @StructureTypeID int
AS
BEGIN
Select StructureTypeID, StructureType
From [dbo].[StructureType]
WHERE [StructureTypeID] = @StructureTypeID
END

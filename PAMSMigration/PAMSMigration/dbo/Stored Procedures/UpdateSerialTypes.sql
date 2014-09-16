Create PROCEDURE [dbo].[UpdateSerialTypes]
    @oldSerialTypeID int,
    @Description nvarchar(50)
AS
UPDATE [Serial].[SerialType]
SET
    Description = @Description
   
WHERE [SerialTypeID] = @oldSerialTypeID
IF @@ROWCOUNT > 0
Select * From [Serial].[SerialType] 
Where [SerialTypeID] = @oldSerialTypeID

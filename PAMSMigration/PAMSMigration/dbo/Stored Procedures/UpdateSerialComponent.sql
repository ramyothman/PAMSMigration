Create PROCEDURE [dbo].[UpdateSerialComponent]
    @oldSerialComponentID int,
    @Description nvarchar(50)
AS
UPDATE [Serial].[SerialComponent]
SET
    Description = @Description
   
WHERE [SerialComponentID] = @oldSerialComponentID
IF @@ROWCOUNT > 0
Select * From [Serial].[SerialComponent] 
Where [SerialComponentID] = @oldSerialComponentID

CREATE PROCEDURE [dbo].[UpdateOrderStatus]
    @OldID int,
    @Name nvarchar(50)
AS
UPDATE [dbo].[OrderStatus]
SET
    Name = @Name
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From OrderStatus 
Where [ID] = @OLDID

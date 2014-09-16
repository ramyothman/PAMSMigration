CREATE PROCEDURE [dbo].[UpdateLostReasons]
    @ReasonCode nvarchar(50),
    @OldID int,
    @ReasonName nvarchar(50)
AS
UPDATE [dbo].[LostReasons]
SET
    ReasonCode = @ReasonCode,
    ReasonName = @ReasonName
WHERE [ID] = @OldID
IF @@ROWCOUNT > 0
Select * From LostReasons 
Where [ID] = @OldID

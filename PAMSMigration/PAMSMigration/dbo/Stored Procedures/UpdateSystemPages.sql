CREATE PROCEDURE [dbo].[UpdateSystemPages]
    @OldID int,
    @ModCode nvarchar(50),
    @PageName nvarchar(50),
    @Path nvarchar(200),
    @IsActive bit
AS
UPDATE [dbo].[SystemPages]
SET
    ModCode = @ModCode,
    PageName = @PageName,
    Path = @Path,
    IsActive = @IsActive
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From SystemPages 
Where [ID] = @OLDID

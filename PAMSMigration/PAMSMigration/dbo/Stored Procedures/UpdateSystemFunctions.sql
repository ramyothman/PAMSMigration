CREATE PROCEDURE [dbo].[UpdateSystemFunctions]
    @OldID int,
    @Name nvarchar(50),
    @IsActive bit
AS
UPDATE [dbo].[SystemFunctions]
SET
    Name = @Name,
    IsActive = @IsActive
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From SystemFunctions 
Where [ID] = @OLDID

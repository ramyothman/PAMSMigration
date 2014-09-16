CREATE PROCEDURE [dbo].[UpdateUserRoles]
    @OldID int,
    @RoleID int,
    @UserID int
AS
UPDATE [dbo].[UserRoles]
SET
    RoleID = @RoleID,
    UserID = @UserID
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From UserRoles 
Where [ID] = @OLDID

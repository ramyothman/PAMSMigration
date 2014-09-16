CREATE PROCEDURE [dbo].[InsertNewUserRoles]
    @RoleID int,
    @UserID int
AS
INSERT INTO [dbo].[UserRoles] (
    [RoleID],
    [UserID])
Values (
    @RoleID,
    @UserID)
IF @@ROWCOUNT > 0
Select * from UserRoles
Where [ID] = @@identity

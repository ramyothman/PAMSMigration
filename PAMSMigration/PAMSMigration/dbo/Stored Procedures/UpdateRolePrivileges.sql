CREATE PROCEDURE [dbo].[UpdateRolePrivileges]
    @OldID int,
    @RoleID int,
    @PageID int,
    @SystemFunctionID int
AS
UPDATE [dbo].[RolePrivileges]
SET
    RoleID = @RoleID,
    PageID = @PageID,
    SystemFunctionID = @SystemFunctionID
WHERE [ID] = @OLDID
IF @@ROWCOUNT > 0
Select * From RolePrivileges 
Where [ID] = @OLDID

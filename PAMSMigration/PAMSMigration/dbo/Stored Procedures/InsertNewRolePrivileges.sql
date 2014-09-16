CREATE PROCEDURE [dbo].[InsertNewRolePrivileges]
    @RoleID int,
    @PageID int,
    @SystemFunctionID int
AS
INSERT INTO [dbo].[RolePrivileges] (
    [RoleID],
    [PageID],
    [SystemFunctionID])
Values (
    @RoleID,
    @PageID,
    @SystemFunctionID)
IF @@ROWCOUNT > 0
Select * from RolePrivileges
Where [ID] = @@identity

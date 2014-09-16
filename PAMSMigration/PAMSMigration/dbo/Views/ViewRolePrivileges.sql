CREATE VIEW [dbo].[ViewRolePrivileges]
AS
SELECT     dbo.RolePrivileges.ID, dbo.RolePrivileges.RoleID, dbo.RolePrivileges.PageID, dbo.RolePrivileges.SystemFunctionID, 
                      dbo.SystemFunctions.Name AS SystemFunctionName, dbo.SystemPages.ModCode AS SystemPageModCode, dbo.SystemPages.PageName, dbo.SystemPages.TabID,
                       dbo.SystemTabs.SystemTabName
FROM         dbo.RolePrivileges INNER JOIN
                      dbo.SystemFunctions ON dbo.RolePrivileges.SystemFunctionID = dbo.SystemFunctions.ID INNER JOIN
                      dbo.SystemPages ON dbo.RolePrivileges.PageID = dbo.SystemPages.ID INNER JOIN
                      dbo.SystemTabs ON dbo.SystemPages.TabID = dbo.SystemTabs.ID

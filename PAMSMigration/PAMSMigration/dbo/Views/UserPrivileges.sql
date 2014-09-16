CREATE VIEW [dbo].[UserPrivileges]
AS
SELECT     dbo.SystemFunctions.Name, Person.Credential.Username, Person.Credential.BusinessEntityId AS ID, dbo.UserRoles.UserID
FROM         Person.Credential INNER JOIN
                      dbo.UserRoles ON Person.Credential.BusinessEntityId = dbo.UserRoles.UserID LEFT OUTER JOIN
                      dbo.RolePrivileges INNER JOIN
                      dbo.SystemPages ON dbo.RolePrivileges.PageID = dbo.SystemPages.ID INNER JOIN
                      dbo.SystemFunctions ON dbo.RolePrivileges.SystemFunctionID = dbo.SystemFunctions.ID ON dbo.UserRoles.RoleID = dbo.RolePrivileges.RoleID

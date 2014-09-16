CREATE VIEW [dbo].[ViewUserPrivileges]
AS
SELECT DISTINCT 
                      dbo.Roles.Name AS RoleName, dbo.SystemFunctions.Name AS SystemFunctionName, dbo.SystemPages.ModCode AS PageCode, dbo.SystemPages.PageName, 
                      Person.Credential.Username, Person.Credential.BusinessEntityId AS ID, Person.Credential.IsActive, dbo.PersonsBranches.BranchID, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                      dbo.Roles.IsPrincipal
FROM         dbo.PersonsBranches RIGHT OUTER JOIN
                      dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON 
                      dbo.PersonsBranches.BranchID = dbo.CompanyBranches.ID RIGHT OUTER JOIN
                      dbo.Roles INNER JOIN
                      dbo.UserRoles ON dbo.Roles.ID = dbo.UserRoles.RoleID INNER JOIN
                      dbo.RolePrivileges ON dbo.Roles.ID = dbo.RolePrivileges.RoleID INNER JOIN
                      dbo.SystemFunctions ON dbo.RolePrivileges.SystemFunctionID = dbo.SystemFunctions.ID INNER JOIN
                      dbo.SystemPages ON dbo.RolePrivileges.PageID = dbo.SystemPages.ID RIGHT OUTER JOIN
                      Person.Credential ON dbo.UserRoles.UserID = Person.Credential.BusinessEntityId ON dbo.PersonsBranches.PersonID = Person.Credential.BusinessEntityId
WHERE     (dbo.SystemPages.IsActive = 1) AND (dbo.SystemFunctions.IsActive = 1) AND (dbo.Roles.IsActive = 1) AND (Person.Credential.IsActive = 1)

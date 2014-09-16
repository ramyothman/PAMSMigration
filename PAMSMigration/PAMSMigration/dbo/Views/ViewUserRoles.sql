CREATE VIEW [dbo].[ViewUserRoles]
AS
SELECT     dbo.Roles.ID, dbo.Roles.Name, dbo.Roles.IsActive, dbo.Roles.LimitedSuppliers, dbo.UserRoles.UserID, dbo.Roles.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Roles INNER JOIN
                      dbo.UserRoles ON dbo.Roles.ID = dbo.UserRoles.RoleID ON dbo.CompanyBranches.ID = dbo.Roles.BranchID

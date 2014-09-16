CREATE VIEW [dbo].[GetAllRoles]
AS
SELECT     dbo.Roles.ID, dbo.Roles.Name, dbo.Roles.IsActive, dbo.Roles.LimitedSuppliers, dbo.Roles.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.Roles.IsPrincipal
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Roles ON dbo.CompanyBranches.ID = dbo.Roles.BranchID

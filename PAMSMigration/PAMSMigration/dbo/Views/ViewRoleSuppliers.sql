CREATE VIEW [dbo].[ViewRoleSuppliers]
AS
SELECT     dbo.UserRoles.RoleID, dbo.UserRoles.UserID, dbo.Roles.LimitedSuppliers, dbo.Roles.ID, dbo.RoleSuppliers.SupplierId, dbo.Roles.BranchID, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.UserRoles INNER JOIN
                      dbo.Roles ON dbo.UserRoles.RoleID = dbo.Roles.ID INNER JOIN
                      dbo.RoleSuppliers ON dbo.Roles.ID = dbo.RoleSuppliers.RoleId ON dbo.CompanyBranches.ID = dbo.Roles.BranchID

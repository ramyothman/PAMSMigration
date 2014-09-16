CREATE VIEW [dbo].[GetAllSuppliersTargets]
AS
SELECT     dbo.SuppliersTargets.ID, dbo.SuppliersTargets.SupplierID, dbo.SuppliersTargets.Year, dbo.SuppliersTargets.Value, dbo.SuppliersTargets.UserName, 
                      dbo.SuppliersTargets.ModifiedDate, dbo.Suppliers.SupplierName, dbo.Suppliers.IsPrincipale, dbo.Suppliers.HasSubSuppliers, dbo.SuppliersTargets.BranchID, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.SuppliersTargets INNER JOIN
                      dbo.Suppliers ON dbo.SuppliersTargets.SupplierID = dbo.Suppliers.SupplierID ON dbo.CompanyBranches.ID = dbo.SuppliersTargets.BranchID

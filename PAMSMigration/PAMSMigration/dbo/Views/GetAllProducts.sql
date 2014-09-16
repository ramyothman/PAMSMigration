CREATE VIEW [dbo].[GetAllProducts]
AS
SELECT     dbo.Products.ProductID, dbo.Products.CategoryID, dbo.Products.ProductName, dbo.Products.ProductDescription, dbo.Products.UserName, dbo.Products.ModifiedDate, 
                      dbo.Products.IsActive, dbo.Products.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Products ON dbo.CompanyBranches.ID = dbo.Products.BranchID

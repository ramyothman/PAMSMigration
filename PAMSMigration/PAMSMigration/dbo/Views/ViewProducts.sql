CREATE VIEW [dbo].[ViewProducts]
AS
SELECT     dbo.Products.ProductID, dbo.Products.CategoryID, dbo.Products.ProductName, dbo.Products.ProductDescription, dbo.Products.UserName, dbo.Products.ModifiedDate, 
                      dbo.Categories.CategoryName, dbo.Products.IsActive, dbo.Products.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Products INNER JOIN
                      dbo.Categories ON dbo.Products.CategoryID = dbo.Categories.CategoryID ON dbo.CompanyBranches.ID = dbo.Products.BranchID

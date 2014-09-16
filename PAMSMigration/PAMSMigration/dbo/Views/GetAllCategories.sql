/****** Object:  View [dbo].[GetAllCategories]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllCategories]
AS
SELECT     dbo.Categories.CategoryID, dbo.Categories.CategoryName, dbo.Categories.CategoryDescription, dbo.CategoryBranches.BranchID, dbo.Categories.UserName, 
                      dbo.Categories.ModifiedDate, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
             dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID 
             inner join CategoryBranches on CompanyBranches.ID  = CategoryBranches.BranchID
             INNER JOIN dbo.Categories ON dbo.Categories.CategoryID = dbo.CategoryBranches.CategoryID

/****** Object:  View [dbo].[GetAllPersonsBranches]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllPersonsBranches]
AS
SELECT     dbo.PersonsBranches.ID, dbo.PersonsBranches.PersonID, dbo.PersonsBranches.BranchID, dbo.PersonsBranches.UserName, dbo.PersonsBranches.ModifiedDate, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                      dbo.PersonsBranches.DefaultBranch
FROM         dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID INNER JOIN
                      dbo.PersonsBranches ON dbo.CompanyBranches.ID = dbo.PersonsBranches.BranchID

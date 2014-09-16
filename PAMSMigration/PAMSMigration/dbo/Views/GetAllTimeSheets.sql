/****** Object:  View [dbo].[GetAllTimeSheets]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllTimeSheets]
AS
SELECT     dbo.TimeSheet.ID, dbo.TimeSheet.PersonID, dbo.TimeSheet.SheetDate, dbo.TimeSheet.UserName, dbo.TimeSheet.ModifiedDate, 
                      Person.PersonLanguages.DisplayName, dbo.TimeSheet.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.TimeSheet INNER JOIN
                      Person.PersonLanguages ON dbo.TimeSheet.PersonID = Person.PersonLanguages.PersonId ON dbo.CompanyBranches.ID = dbo.TimeSheet.BranchID

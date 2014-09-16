/****** Object:  View [dbo].[GetAllEmployeeHourRate]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllEmployeeHourRate]
AS
SELECT     dbo.EmployeeHourRate.ID, dbo.EmployeeHourRate.Year, dbo.EmployeeHourRate.Value, dbo.EmployeeHourRate.UserName, dbo.EmployeeHourRate.ModifiedDate, 
                      dbo.EmployeeHourRate.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.EmployeeHourRate ON dbo.CompanyBranches.ID = dbo.EmployeeHourRate.BranchID

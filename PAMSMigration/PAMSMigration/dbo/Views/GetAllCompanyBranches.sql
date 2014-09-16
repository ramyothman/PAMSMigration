/****** Object:  View [dbo].[GetAllCompanyBranches]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllCompanyBranches]
AS
SELECT     dbo.CompanyBranches.ID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.StreetFL, 
                      dbo.CompanyBranches.StateFL, dbo.CompanyBranches.CityFL, dbo.CompanyBranches.CountryFL, dbo.CompanyBranches.StreetSL, dbo.CompanyBranches.StateSL, 
                      dbo.CompanyBranches.CitySL, dbo.CompanyBranches.CountrySL, dbo.CompanyBranches.ZipCode, dbo.CompanyBranches.PostalCode, 
                      dbo.CompanyBranches.Email, dbo.CompanyBranches.CommercialRecord, dbo.CompanyBranches.TaxCard, dbo.CompanyBranches.TaxFile, 
                      dbo.CompanyBranches.Phone, dbo.CompanyBranches.Mobile, dbo.CompanyBranches.Fax, dbo.CompanyBranches.WebSite, dbo.CompanyBranches.Slogen, 
                      dbo.CompanyBranches.BranchStatment, dbo.CompanyBranches.Logo, dbo.CompanyBranches.UserName, dbo.CompanyBranches.ModifiedDate, 
                      dbo.CompanyBranches.CurrencyExchangeLink, dbo.CompanyBranches.FinancialYearStart, dbo.CompanyBranches.FinancialYearEnd, 
                      dbo.CompanyBranches.DueDateNumOfDays, dbo.CompanyBranches.DeliveryTimeNumOfDays, dbo.CompanyBranches.ExpiredGuaranteesNumOfDays, 
                      dbo.CompanyBranches.PastProjectsNumOfDays, dbo.CompanyBranches.BaseCurrencyID, dbo.CompanyBranches.ConvertToCompletedProcess, 
                      dbo.CompanyBranches.NumOfMinutesPerDay, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyBranches INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID

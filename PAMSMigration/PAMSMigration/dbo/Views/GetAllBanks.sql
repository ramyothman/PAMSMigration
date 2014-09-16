/****** Object:  View [dbo].[GetAllBanks]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllBanks]
AS
SELECT     dbo.Banks.BankCode, dbo.Banks.BankName, dbo.BankBranches.BankAccountNumber, dbo.Banks.ID, dbo.BankBranches.BranchID, 
                      dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, 
                      dbo.Banks.CurrencyID, dbo.Banks.SwiftCode, dbo.Currencies.CurrencyName, dbo.Currencies.CurrencyCode
FROM         dbo.Currencies RIGHT OUTER JOIN
                      dbo.Banks ON dbo.Currencies.ID = dbo.Banks.CurrencyID LEFT OUTER JOIN
                      dbo.CompanyBranches INNER JOIN
                      dbo.BankBranches ON dbo.CompanyBranches.ID = dbo.BankBranches.BranchID INNER JOIN
                      dbo.CompanyCountries ON dbo.CompanyBranches.CountryID = dbo.CompanyCountries.ID ON dbo.Banks.ID = dbo.BankBranches.BankID

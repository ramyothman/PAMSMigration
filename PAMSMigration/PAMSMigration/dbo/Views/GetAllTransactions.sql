/****** Object:  View [dbo].[GetAllTransactions]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllTransactions]
AS
SELECT     dbo.Transactions.TransactionID, dbo.Transactions.SupplierID, dbo.Transactions.InquiryCode, dbo.Transactions.Amount, dbo.Transactions.CurrencyID, 
                      dbo.Transactions.RateToEuro, dbo.Transactions.AmountInEuro, dbo.Transactions.BankID, dbo.Transactions.TransactionDate, dbo.Transactions.Reason, 
                      dbo.Transactions.Reference, dbo.Transactions.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Transactions ON dbo.CompanyBranches.ID = dbo.Transactions.BranchID

CREATE VIEW [dbo].[ViewTransactions]
AS
SELECT     dbo.Transactions.TransactionID, dbo.Transactions.SupplierID, dbo.Transactions.InquiryCode, dbo.Transactions.Amount, dbo.Transactions.CurrencyID, 
                      dbo.Transactions.BankID, dbo.Transactions.TransactionDate, dbo.Transactions.Reason, dbo.Transactions.Reference, dbo.Suppliers.SupplierName, 
                      dbo.Suppliers.SupplierWebSite, dbo.Currencies.CurrencyName, dbo.Banks.BankName
                      ,dbo.fn_GetBankAccountNumber(dbo.Banks.ID) as BankAccountNumber, dbo.Transactions.RateToEuro, 
                      dbo.Transactions.AmountInEuro, dbo.Currencies.CurrencyCode, dbo.Banks.BankCode, dbo.Transactions.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Transactions INNER JOIN
                      dbo.Suppliers ON dbo.Transactions.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Currencies ON dbo.Transactions.CurrencyID = dbo.Currencies.ID INNER JOIN
                      dbo.Banks ON dbo.Transactions.BankID = dbo.Banks.ID ON dbo.CompanyBranches.ID = dbo.Transactions.BranchID

CREATE VIEW [dbo].[GRSubCommissionsTotal]
AS
SELECT     dbo.Commissions.InquiryNumber, SUM(dbo.Commissions.CommissionAmountInEuro) AS TotalCommissionAmount, 
                      SUM(dbo.CommissionPayments.PaidCommissionAmountInEuro) AS PaidCommissionAmount, SUM(dbo.Commissions.CommissionAmountInEuro) 
                      - SUM(dbo.CommissionPayments.PaidCommissionAmountInEuro) AS RemainingCommissionAmount, YEAR(dbo.Transactions.TransactionDate) AS Year, 
                      dbo.Transactions.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, 
                      dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                      dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Commissions INNER JOIN
                      dbo.CommissionPayments ON dbo.Commissions.InquiryNumber = dbo.CommissionPayments.InquiryNumber INNER JOIN
                      dbo.Transactions ON dbo.CommissionPayments.TransactionID = dbo.Transactions.TransactionID ON dbo.CompanyBranches.ID = dbo.Transactions.BranchID
GROUP BY dbo.Commissions.InquiryNumber, dbo.Transactions.TransactionDate, dbo.Transactions.BranchID, dbo.CompanyBranches.BranchNameFL, 
                      dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName

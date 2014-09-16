CREATE VIEW [dbo].[ViewCommissionPayments]
AS
SELECT     dbo.CommissionPayments.InquiryNumber, dbo.CommissionPayments.TransactionID, dbo.CommissionPayments.CommissionPaymentNumber, 
           dbo.CommissionPayments.PaidCommissionAmount, dbo.CommissionPayments.ONDate, dbo.CommissionPayments.CurrencyID, 
           dbo.CommissionPayments.RateToEuro, dbo.CommissionPayments.PaidCommissionAmountInEuro, dbo.CommissionPayments.SumPaidCommissionAmountInEuro, 
           dbo.CommissionPayments.DueCommissionAmountInEuro, dbo.CommissionPayments.Comment, dbo.CommissionPayments.UserName, 
           dbo.CommissionPayments.BankID, dbo.CommissionPayments.ModifiedDate, dbo.Currencies.CurrencyName, dbo.BankBranches.BankAccountNumber, dbo.Banks.BankName, 
           dbo.Banks.BankCode, dbo.Currencies.CurrencyCode, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
           dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM       dbo.CompanyCountries INNER JOIN
           dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
           dbo.CommissionPayments INNER JOIN
           dbo.Currencies ON dbo.CommissionPayments.CurrencyID = dbo.Currencies.ID INNER JOIN
           dbo.Banks ON dbo.CommissionPayments.BankID = dbo.Banks.ID INNER JOIN
           BankBranches on Banks.ID=BankBranches.BankID inner join 
           dbo.Inquiries ON dbo.CommissionPayments.InquiryNumber = dbo.Inquiries.InquiryNumber ON dbo.CompanyBranches.ID = dbo.Inquiries.BranchID

CREATE VIEW [dbo].[TransactionCommissions]
AS
SELECT     dbo.CommissionPayments.InquiryNumber, dbo.CommissionPayments.CommissionPaymentNumber, dbo.CommissionPayments.PaidCommissionAmount, 
                      dbo.CommissionPayments.RateToEuro, dbo.CommissionPayments.PaidCommissionAmountInEuro, dbo.CommissionPayments.TransactionID, 
                      dbo.CommissionPayments.ONDate, dbo.ViewCommissions.ShotecNo, dbo.CommissionPayments.CurrencyID, dbo.CommissionPayments.BankID, 
                      dbo.Currencies.CurrencyCode, dbo.Banks.BankCode, dbo.ViewCommissions.BranchID, dbo.ViewCommissions.BranchNameFL, 
                      dbo.ViewCommissions.BranchNameSL, dbo.ViewCommissions.CountryID, dbo.ViewCommissions.CountryName
FROM         dbo.CommissionPayments INNER JOIN
                      dbo.ViewCommissions ON dbo.CommissionPayments.InquiryNumber = dbo.ViewCommissions.InquiryNumber INNER JOIN
                      dbo.Banks ON dbo.CommissionPayments.BankID = dbo.Banks.ID INNER JOIN
                      dbo.Currencies ON dbo.CommissionPayments.CurrencyID = dbo.Currencies.ID

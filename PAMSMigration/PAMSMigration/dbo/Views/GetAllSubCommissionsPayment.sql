/****** Object:  View [dbo].[GetAllSubCommissionsPayment]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GetAllSubCommissionsPayment]
AS
SELECT     SubCommissionID, SubCommissionPaymentNumber, PaidSubCommissionAmount, ONDate, CurrencyID, RateToEuro, PaidSubCommissionAmountInEuro, 
                      SumPaidSubCommissionAmountInEuro, DueSubCommissionAmountInEuro, Comment, UserName, BankID AS BankCode, ModifiedDate
FROM         dbo.SubCommissionsPayment

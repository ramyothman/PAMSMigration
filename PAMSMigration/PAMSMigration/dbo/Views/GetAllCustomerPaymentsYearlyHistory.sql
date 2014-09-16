CREATE VIEW [dbo].[GetAllCustomerPaymentsYearlyHistory]
AS
SELECT     dbo.CustomerPaymentsYearlyHistory.CustomerPaymentID, dbo.CustomerPaymentsYearlyHistory.InquiryNumber, 
                      dbo.CustomerPaymentsYearlyHistory.PaymentNumber, dbo.CustomerPaymentsYearlyHistory.PaidAmount, 
                      dbo.CustomerPaymentsYearlyHistory.PaidAmountRateToEuro, dbo.CustomerPaymentsYearlyHistory.PaidAmountInEuro, 
                      dbo.CustomerPaymentsYearlyHistory.ONDate, dbo.CustomerPaymentsYearlyHistory.SumPaid, dbo.CustomerPaymentsYearlyHistory.Deduction, 
                      dbo.CustomerPaymentsYearlyHistory.DeductionNumber, dbo.CustomerPaymentsYearlyHistory.DeductionAmount, 
                      dbo.CustomerPaymentsYearlyHistory.DeductionAmountRateToEuro, dbo.CustomerPaymentsYearlyHistory.DeductionAmountInEuro, 
                      dbo.CustomerPaymentsYearlyHistory.Reason, dbo.CustomerPaymentsYearlyHistory.SumDeduction, dbo.CustomerPaymentsYearlyHistory.RestPayment, 
                      dbo.CustomerPaymentsYearlyHistory.Comment, dbo.CustomerPaymentsYearlyHistory.UserName, dbo.CustomerPaymentsYearlyHistory.ModifiedDate, 
                      dbo.CustomerPaymentsYearlyHistory.PaidAmountRateDate, dbo.CustomerPaymentsYearlyHistory.DeductionAmountRateDate, 
                      dbo.CustomerPaymentsYearlyHistory.PaidAmountCurrencyID, dbo.CustomerPaymentsYearlyHistory.DeductionAmountCurrencyID, 
                      Currencies_1.CurrencyCode AS DeductionAmountCurrencyCode, dbo.Currencies.CurrencyCode AS PaidAmountCurrencyCode, 
                      dbo.CustomerPaymentsYearlyHistory.InvoiceNumber, dbo.InquiriesYearlyHistory.SupplierID, dbo.InquiriesYearlyHistory.Year
FROM         dbo.CustomerPaymentsYearlyHistory INNER JOIN
                      dbo.InquiriesYearlyHistory ON dbo.CustomerPaymentsYearlyHistory.InquiryNumber = dbo.InquiriesYearlyHistory.InquiryNumber LEFT OUTER JOIN
                      dbo.Currencies AS Currencies_1 ON dbo.CustomerPaymentsYearlyHistory.DeductionAmountCurrencyID = Currencies_1.ID LEFT OUTER JOIN
                      dbo.Currencies ON dbo.CustomerPaymentsYearlyHistory.PaidAmountCurrencyID = dbo.Currencies.ID

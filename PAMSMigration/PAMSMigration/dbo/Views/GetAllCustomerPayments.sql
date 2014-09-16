CREATE VIEW [dbo].[GetAllCustomerPayments]
AS
SELECT        dbo.CustomerPayments.CustomerPaymentID, dbo.CustomerPayments.InquiryNumber, dbo.CustomerPayments.PaymentNumber, 
                         dbo.CustomerPayments.PaidAmount, dbo.CustomerPayments.PaidAmountRateToEuro, dbo.CustomerPayments.PaidAmountInEuro, 
                         dbo.CustomerPayments.ONDate, dbo.CustomerPayments.SumPaid, dbo.CustomerPayments.Deduction, dbo.CustomerPayments.DeductionNumber, 
                         dbo.CustomerPayments.DeductionAmount, dbo.CustomerPayments.DeductionAmountRateToEuro, dbo.CustomerPayments.DeductionAmountInEuro, 
                         dbo.CustomerPayments.Reason, dbo.CustomerPayments.SumDeduction, dbo.CustomerPayments.RestPayment, dbo.CustomerPayments.Comment, 
                         dbo.CustomerPayments.UserName, dbo.CustomerPayments.ModifiedDate, dbo.CustomerPayments.PaidAmountRateDate, 
                         dbo.CustomerPayments.DeductionAmountRateDate, dbo.CustomerPayments.PaidAmountCurrencyID, dbo.CustomerPayments.DeductionAmountCurrencyID, 
                         Currencies_1.CurrencyCode AS DeductionAmountCurrencyCode, dbo.Currencies.CurrencyCode AS PaidAmountCurrencyCode, 
                         dbo.CustomerPayments.InvoiceNumber, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Customers.CustomerID, dbo.Customers.CompanyCode, 
                         dbo.Customers.CompanyName, dbo.Inquiries.ShotecNo, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, 
                         dbo.CompanyBranches.BranchNameSL, dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName, dbo.CustomerPayments.IsPaid, 
                         dbo.CustomerPayments.Amount, dbo.CustomerPayments.CurrencyID
FROM            dbo.Currencies RIGHT OUTER JOIN
                         dbo.CustomerPayments INNER JOIN
                         dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                         dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                         dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                         dbo.CompanyCountries INNER JOIN
                         dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND 
                         dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID AND dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID ON 
                         dbo.Inquiries.BranchID = dbo.CompanyBranches.ID LEFT OUTER JOIN
                         dbo.Currencies AS Currencies_1 ON dbo.CustomerPayments.DeductionAmountCurrencyID = Currencies_1.ID ON 
                         dbo.Currencies.ID = dbo.CustomerPayments.PaidAmountCurrencyID

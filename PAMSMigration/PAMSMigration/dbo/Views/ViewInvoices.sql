CREATE VIEW [dbo].[ViewInvoices]
AS
SELECT        dbo.CustomerPayments.CustomerPaymentID, dbo.CustomerPayments.InquiryNumber, dbo.CustomerPayments.InvoiceNumber, 
                         dbo.CustomerPayments.PaymentNumber, dbo.CustomerPayments.PaidAmount, dbo.CustomerPayments.ONDate, dbo.CustomerPayments.SumPaid, 
                         dbo.CustomerPayments.Deduction, dbo.CustomerPayments.DeductionNumber, dbo.CustomerPayments.DeductionAmount, dbo.CustomerPayments.Reason, 
                         dbo.CustomerPayments.SumDeduction, dbo.CustomerPayments.RestPayment, dbo.CustomerPayments.Comment, dbo.CustomerPayments.UserName, 
                         dbo.CustomerPayments.ModifiedDate, dbo.CustomerPayments.PaidAmountCurrencyID, dbo.CustomerPayments.PaidAmountRateToEuro, 
                         dbo.CustomerPayments.PaidAmountInEuro, dbo.CustomerPayments.PaidAmountRateDate, dbo.CustomerPayments.IsPaid, 
                         dbo.CustomerPayments.DeductionAmountRateDate, dbo.CustomerPayments.DeductionAmountInEuro, dbo.CustomerPayments.DeductionAmountRateToEuro, 
                         dbo.CustomerPayments.DeductionAmountCurrencyID, dbo.CustomerPayments.Amount, dbo.CustomerPayments.CurrencyID, 
                         Person.PersonLanguages.DisplayName AS ResponsibleEngineer, dbo.InquiryTypes.InquiryType, dbo.Customers.CompanyCode, 
                         dbo.Customers.CompanyName, dbo.Customers.CompanyWebSite, dbo.Customers.ContactAddress, dbo.Inquiries.CustomerInquiryNumber, 
                         dbo.Inquiries.InquiryDate, dbo.Inquiries.BidDueDate, dbo.Inquiries.SupplierQuotationNumber, dbo.Suppliers.SupplierName, dbo.Suppliers.SupplierWebSite, 
                         dbo.Suppliers.IsPrincipale, dbo.Inquiries.QuotationPrice, dbo.Currencies.CurrencyCode AS QuotationCurrency, dbo.Inquiries.RateToEuro, 
                         dbo.Inquiries.ONDate AS Expr1, dbo.Inquiries.QuotationPriceInEuro, dbo.Inquiries.UserName AS Expr2, dbo.Inquiries.ProductDescription, 
                         dbo.Inquiries.ShotecNo, dbo.InquiryStatus.Name AS InquiryStatus, dbo.Inquiries.OrderPercentage, dbo.ProjectTypes.ProjectType, dbo.Inquiries.OfferDate, 
                         dbo.ProductTypes.ProductType, dbo.Inquiries.HasGuarantee
FROM            dbo.CustomerPayments INNER JOIN
                         dbo.Inquiries ON dbo.CustomerPayments.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                         Person.PersonLanguages ON dbo.Inquiries.ResponsibleEngineerID = Person.PersonLanguages.PersonId INNER JOIN
                         dbo.InquiryTypes ON dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID AND dbo.Inquiries.InquiryTypeID = dbo.InquiryTypes.ID INNER JOIN
                         dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID AND dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                         dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID AND dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                         dbo.Currencies ON dbo.Inquiries.CurrencyID = dbo.Currencies.ID AND dbo.Inquiries.CurrencyID = dbo.Currencies.ID INNER JOIN
                         dbo.InquiryStatus ON dbo.Inquiries.InquiryStatusID = dbo.InquiryStatus.ID INNER JOIN
                         dbo.ProjectTypes ON dbo.Inquiries.ProjectTypeID = dbo.ProjectTypes.ID INNER JOIN
                         dbo.ProductTypes ON dbo.Inquiries.ProductTypeID = dbo.ProductTypes.ProductTypeID

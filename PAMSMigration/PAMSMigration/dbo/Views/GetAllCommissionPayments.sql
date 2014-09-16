CREATE VIEW [dbo].[GetAllCommissionPayments]
AS
SELECT        dbo.CommissionPayments.InquiryNumber, dbo.CommissionPayments.TransactionID, dbo.CommissionPayments.CommissionPaymentNumber, dbo.CommissionPayments.PaidCommissionAmount, 
                         dbo.CommissionPayments.ONDate, dbo.CommissionPayments.CurrencyID, dbo.CommissionPayments.RateToEuro, dbo.CommissionPayments.PaidCommissionAmountInEuro, 
                         dbo.CommissionPayments.SumPaidCommissionAmountInEuro, dbo.CommissionPayments.DueCommissionAmountInEuro, dbo.CommissionPayments.Comment, dbo.CommissionPayments.UserName, 
                         dbo.CommissionPayments.BankID, dbo.CommissionPayments.ModifiedDate, dbo.Currencies.CurrencyCode, dbo.Banks.BankCode, dbo.ViewProjectInquiry.CustomerID, dbo.ViewProjectInquiry.SupplierID, 
                         dbo.ViewProjectInquiry.QuotationPrice, dbo.ViewProjectInquiry.QuotationCurrency AS OfferCurrencyID, dbo.ViewProjectInquiry.SupplierQuotationNumber, dbo.ViewProjectInquiry.ProjectID, 
                         dbo.ViewProjectInquiry.ProjectCode, dbo.ViewProjectInquiry.ProjectName, dbo.ViewProjectInquiry.CurrencyCode AS OfferCurrencyCode, dbo.ViewProjectInquiry.OrderChanceID, 
                         dbo.ViewProjectInquiry.OrderChance, dbo.ViewProjectInquiry.ShotecNo, dbo.ViewProjectInquiry.ProductDescription, dbo.Orders.CustomerOrderNumber, dbo.Orders.SupplierOrderNumber, 
                         dbo.Orders.OrderNumber, dbo.Orders.PriceInEuro, dbo.Orders.Price, dbo.Orders.CurrencyID AS OrderCurrencyID, Currencies_1.CurrencyCode AS OrderCurrencyCode, dbo.ViewProjectInquiry.BranchID, 
                         dbo.ViewProjectInquiry.BranchNameFL, dbo.ViewProjectInquiry.BranchNameSL, dbo.ViewProjectInquiry.CountryID, dbo.ViewProjectInquiry.CountryName, dbo.ViewProjectInquiry.ClientName, 
                         dbo.ViewProjectInquiry.SupplierName, dbo.ViewProjectInquiry.CategoryName, dbo.ViewProjectInquiry.CompanyCode, dbo.ViewProjectInquiry.ResponsibleEngineerDisplayName, 
                         dbo.ViewProjectInquiry.ResponsibleEngineerID, dbo.Transactions.TransactionDate, dbo.CommissionPayments.IsPaid
FROM            dbo.CommissionPayments INNER JOIN
                         dbo.Banks ON dbo.CommissionPayments.BankID = dbo.Banks.ID INNER JOIN
                         dbo.Currencies ON dbo.CommissionPayments.CurrencyID = dbo.Currencies.ID INNER JOIN
                         dbo.ViewProjectInquiry ON dbo.CommissionPayments.InquiryNumber = dbo.ViewProjectInquiry.ProjectSerialNumber INNER JOIN
                         dbo.Orders ON dbo.ViewProjectInquiry.ProjectSerialNumber = dbo.Orders.InquiryNumber INNER JOIN
                         dbo.Currencies AS Currencies_1 ON dbo.Orders.CurrencyID = Currencies_1.ID INNER JOIN
                         dbo.Transactions ON dbo.CommissionPayments.TransactionID = dbo.Transactions.TransactionID

CREATE VIEW [dbo].[View_NewSubCommissionGraph]
AS
SELECT     dbo.Inquiries.CustomerID, dbo.Customers.CompanyName AS CustomerName, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Orders.Delivered, 
                      dbo.Orders.DeliveredON AS DeliveredDate, dbo.Orders.OrderDate, dbo.Orders.ExpansionDeliveryDate, 
                      dbo.view_SubViewCommissionAmounts.PaidCommissionAmount, dbo.view_SubViewCommissionAmounts.RemainingCommissionAmount, 
                      dbo.view_SubViewCommissionAmounts.CommissionAmount, dbo.Inquiries.BranchID, dbo.CompanyBranches.BranchNameFL, dbo.CompanyBranches.BranchNameSL, 
                      dbo.CompanyBranches.CountryID, dbo.CompanyCountries.CountryName
FROM         dbo.CompanyCountries INNER JOIN
                      dbo.CompanyBranches ON dbo.CompanyCountries.ID = dbo.CompanyBranches.CountryID INNER JOIN
                      dbo.Inquiries INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Commissions ON dbo.Inquiries.InquiryNumber = dbo.Commissions.InquiryNumber INNER JOIN
                      dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber INNER JOIN
                      dbo.view_SubViewCommissionAmounts ON dbo.Inquiries.InquiryNumber = dbo.view_SubViewCommissionAmounts.InquiryNumber ON 
                      dbo.CompanyBranches.ID = dbo.Inquiries.BranchID

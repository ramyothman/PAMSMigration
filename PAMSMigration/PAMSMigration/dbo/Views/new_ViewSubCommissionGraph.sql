/****** Object:  View [dbo].[new_ViewSubCommissionGraph]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[new_ViewSubCommissionGraph]
AS
SELECT     dbo.SubViewCommissionsTotals.InquiryNumber, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName AS CustomerName, dbo.Inquiries.SupplierID, 
                      dbo.Suppliers.SupplierName, dbo.Orders.Delivered, dbo.Orders.DeliveredON AS DeliveredDate, dbo.Orders.OrderDate, 
                      dbo.SubViewCommissionsTotals.CommissionAmount, dbo.SubViewCommissionsTotals.PaidCommissionAmount, 
                      dbo.SubViewCommissionsTotals.RemainingCommissionAmount, dbo.SubViewCommissionsTotals.CommissionPaymentDate, dbo.Orders.ExpansionDeliveryDate, 
                      dbo.OrderStatus.Name AS OrderStatus, dbo.Inquiries.BranchID, dbo.Customers.CompanyCode
FROM         dbo.SubViewCommissionsTotals INNER JOIN
                      dbo.Inquiries ON dbo.SubViewCommissionsTotals.InquiryNumber = dbo.Inquiries.InquiryNumber INNER JOIN
                      dbo.Customers ON dbo.Inquiries.CustomerID = dbo.Customers.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                      dbo.Commissions ON dbo.Inquiries.InquiryNumber = dbo.Commissions.InquiryNumber INNER JOIN
                      dbo.Orders ON dbo.Inquiries.InquiryNumber = dbo.Orders.InquiryNumber INNER JOIN
                      dbo.OrderStatus ON dbo.Orders.OrderStatusID = dbo.OrderStatus.ID

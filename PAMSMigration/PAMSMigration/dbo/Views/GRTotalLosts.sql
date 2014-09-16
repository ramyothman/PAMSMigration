/****** Object:  View [dbo].[GRTotalLosts]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GRTotalLosts]
AS
SELECT     YEAR(dbo.Inquiries.InquiryDate) AS Year, COUNT(dbo.Losts.InquiryNumber) AS CountLosts, dbo.Inquiries.CustomerID, dbo.Customers.CompanyName, 
                      dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Losts.LostReasonID, dbo.LostReasons.ReasonName, dbo.LostReasons.ReasonCode AS LostReasonCode,
                       dbo.Inquiries.BranchID
FROM         dbo.Customers INNER JOIN
                      dbo.Inquiries ON dbo.Customers.CustomerID = dbo.Inquiries.CustomerID INNER JOIN
                      dbo.Suppliers ON dbo.Inquiries.SupplierID = dbo.Suppliers.SupplierID CROSS JOIN
                      dbo.Losts INNER JOIN
                      dbo.LostReasons ON dbo.Losts.LostReasonID = dbo.LostReasons.ID
GROUP BY dbo.Inquiries.CustomerID, dbo.Customers.CompanyName, dbo.Inquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Losts.LostReasonID, 
                      dbo.LostReasons.ReasonName, YEAR(dbo.Inquiries.InquiryDate), dbo.LostReasons.ReasonCode, dbo.Inquiries.BranchID

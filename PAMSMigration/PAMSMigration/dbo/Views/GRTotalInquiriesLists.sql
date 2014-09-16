/****** Object:  View [dbo].[GRTotalInquiriesLists]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GRTotalInquiriesLists]
AS
SELECT     dbo.GetAllInquiries.InquiryStatus, YEAR(dbo.GetAllInquiries.InquiryDate) AS Year, COUNT(dbo.GetAllInquiries.InquiryStatus) AS StatusCount, 
                      dbo.GetAllInquiries.CustomerID, dbo.GetAllInquiries.SupplierID, dbo.Suppliers.SupplierName, dbo.Customers.CompanyName, dbo.GetAllInquiries.BranchID
FROM         dbo.GetAllInquiries LEFT OUTER JOIN
                      dbo.Customers ON dbo.GetAllInquiries.CustomerID = dbo.Customers.CustomerID LEFT OUTER JOIN
                      dbo.Suppliers ON dbo.GetAllInquiries.SupplierID = dbo.Suppliers.SupplierID
GROUP BY YEAR(dbo.GetAllInquiries.InquiryDate), dbo.GetAllInquiries.InquiryStatus, dbo.GetAllInquiries.CustomerID, dbo.GetAllInquiries.SupplierID, 
                      dbo.Suppliers.SupplierName, dbo.Customers.CompanyName, dbo.GetAllInquiries.BranchID

CREATE VIEW [dbo].[viewCurrentGRProjectAndSubProjectsTotals]
AS
SELECT     InquiryStatus, YEAR(InquiryDate) AS Year, COUNT(InquiryStatus) AS StatusCount, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, 
                      OrderStatusID, SUM(TotalAmount) AS TotalAmount, ProductTypeID, IsSubOffer
FROM         dbo.viewCurrentSubFinalProjects
GROUP BY YEAR(InquiryDate), InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, OrderStatusID, ProductTypeID, IsSubOffer

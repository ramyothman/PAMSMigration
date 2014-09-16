CREATE VIEW [dbo].[viewGRProjectTotalsOLD]
AS
SELECT     InquiryStatus, YEAR(InquiryDate) AS Year, COUNT(InquiryStatus) AS StatusCount, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, OrderStatusID, 
                      SUM(TotalAmount) AS TotalAmount, ProductTypeID, CompanyCode, BranchID, InquiryDate, OrderDate, LostDate, OfferDate, DeliveredON
FROM         dbo.viewSubFinalProjects
GROUP BY YEAR(InquiryDate), InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, OrderStatusID, ProductTypeID, CompanyCode, BranchID, 
                      InquiryDate, OrderDate, LostDate, OfferDate, DeliveredON

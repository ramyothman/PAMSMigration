/****** Object:  View [dbo].[GRTurnOverTotals]    Script Date: 03/20/2013 12:03:15 ******/
CREATE VIEW [dbo].[GRTurnOverTotals]
AS
SELECT     InquiryStatus, YEAR(InquiryDate) AS Year, SUM(PriceInEuro) AS PriceInEuro, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, OrderStatusID, 
                      ProductTypeID, BranchID, CompanyCode
FROM         dbo.ViewTurnOverFinal
GROUP BY YEAR(InquiryDate), InquiryStatus, CustomerID, SupplierID, SupplierName, CompanyName, OrderStatus, OrderStatusID, ProductTypeID, BranchID, CompanyCode

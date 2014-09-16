/****** Object:  View [dbo].[ViewTurnOverFinal]    Script Date: 03/20/2013 12:03:16 ******/
CREATE VIEW [dbo].[ViewTurnOverFinal]
AS
SELECT     InquiryStatus, CustomerID, SupplierID, CompanyName, SupplierName, InquiryDate, CASE WHEN InquiryStatus IN ('Order', 'Delivered') 
                      THEN PriceInEuro ELSE QuotationPriceInEuro END AS PriceInEuro, OrderStatus, OrderStatusID, ProductTypeID, BranchID, CompanyCode
FROM         dbo.viewSubFinalProjects

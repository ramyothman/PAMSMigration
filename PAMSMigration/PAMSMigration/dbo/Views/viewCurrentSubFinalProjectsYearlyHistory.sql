CREATE VIEW [dbo].[viewCurrentSubFinalProjectsYearlyHistory]
AS
SELECT     dbo.viewSubProjectTotalsYearlyHistory.InquiryStatus, dbo.viewSubProjectTotalsYearlyHistory.CustomerID, dbo.viewSubProjectTotalsYearlyHistory.SupplierID, 
                      dbo.viewSubProjectTotalsYearlyHistory.CompanyName, dbo.viewSubProjectTotalsYearlyHistory.SupplierName, CASE WHEN InquiryStatus IN ('Inquiry') 
                      THEN InquiryDate ELSE CASE WHEN InquiryStatus IN ('Offer') THEN OfferDate ELSE CASE WHEN InquiryStatus IN ('Lost', 'Cancelled', 'Regret', 'LateResponse') 
                      THEN LostDate ELSE CASE WHEN InquiryStatus = 'Order' THEN OrderDate ELSE ShipmentDate END END END END AS InquiryDate, 
                      dbo.viewSubProjectTotalsYearlyHistory.PriceInEuro, dbo.viewSubProjectTotalsYearlyHistory.QuotationPriceInEuro, 
                      dbo.viewSubProjectTotalsYearlyHistory.OrderDate, dbo.viewSubProjectTotalsYearlyHistory.OrderStatusID, dbo.viewSubProjectTotalsYearlyHistory.OrderStatus, 
                      CASE WHEN InquiryStatus IN ('Offer', 'Lost', 'Cancelled', 'Regret', 'LateResponse') THEN QuotationPriceInEuro ELSE CASE WHEN InquiryStatus IN ('Delivered') 
                      THEN ShipmentPriceInEuro ELSE ISNULL(BackLog, 0) END END AS TotalAmount, dbo.viewSubProjectTotalsYearlyHistory.ReasonName, 
                      dbo.viewSubProjectTotalsYearlyHistory.ProductTypeID, dbo.viewSubProjectTotalsYearlyHistory.IsSubOffer, dbo.Suppliers.IsPrincipale, 
                      dbo.Suppliers.HasSubSuppliers, dbo.viewSubProjectTotalsYearlyHistory.InquiryStatusName, dbo.viewSubProjectTotalsYearlyHistory.ProjectTypeID, 
                      dbo.viewSubProjectTotalsYearlyHistory.OfferStatus, dbo.viewSubProjectTotalsYearlyHistory.InquiryType, dbo.viewSubProjectTotalsYearlyHistory.Year, 
                      dbo.viewSubProjectTotalsYearlyHistory.BranchID
FROM         dbo.viewSubProjectTotalsYearlyHistory INNER JOIN
                      dbo.Suppliers ON dbo.viewSubProjectTotalsYearlyHistory.SupplierID = dbo.Suppliers.SupplierID

CREATE VIEW [dbo].[viewCurrentSubFinalProjects]
AS
SELECT     dbo.viewSubProjectTotals.InquiryStatus, dbo.viewSubProjectTotals.CustomerID, dbo.viewSubProjectTotals.SupplierID, dbo.viewSubProjectTotals.CompanyName, 
                      dbo.viewSubProjectTotals.SupplierName, CASE WHEN InquiryStatus IN ('Inquiry') THEN InquiryDate ELSE CASE WHEN InquiryStatus IN ('Offer') 
                      THEN OfferDate ELSE CASE WHEN InquiryStatus IN ('Lost', 'Cancelled', 'Regret', 'LateResponse') 
                      THEN LostDate ELSE CASE WHEN InquiryStatus = 'Order' THEN OrderDate ELSE ShipmentDate END END END END AS InquiryDate, 
                      dbo.viewSubProjectTotals.PriceInEuro, dbo.viewSubProjectTotals.QuotationPriceInEuro, dbo.viewSubProjectTotals.OrderDate, 
                      dbo.viewSubProjectTotals.OrderStatusID, dbo.viewSubProjectTotals.OrderStatus, CASE WHEN InquiryStatus IN ('Offer', 'Lost', 'Cancelled', 'Regret', 'LateResponse') 
                      THEN QuotationPriceInEuro ELSE CASE WHEN InquiryStatus IN ('Delivered') THEN ShipmentPriceInEuro ELSE ISNULL(BackLog, 0) END END AS TotalAmount, 
                      dbo.viewSubProjectTotals.ReasonName, dbo.viewSubProjectTotals.ProductTypeID, dbo.viewSubProjectTotals.IsSubOffer, dbo.Suppliers.IsPrincipale, 
                      dbo.Suppliers.HasSubSuppliers, dbo.viewSubProjectTotals.InquiryStatusName, dbo.viewSubProjectTotals.ProjectTypeID, dbo.viewSubProjectTotals.OfferStatus, 
                      dbo.viewSubProjectTotals.InquiryType, dbo.viewSubProjectTotals.BranchID, dbo.SupplierBranch.BranchID AS SupplierBranchID, dbo.Suppliers.IsGeneral
FROM                  dbo.viewSubProjectTotals INNER JOIN dbo.Suppliers 
					  ON dbo.viewSubProjectTotals.SupplierID = dbo.Suppliers.SupplierID
					  inner join SupplierBranch 
					  on Suppliers.SupplierID = SupplierBranch.SupplierID

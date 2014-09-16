CREATE VIEW [dbo].[ViewFullSupplierWorkLoadOfferBudget]
AS
SELECT     dbo.ViewSupplierWorkLoadOfferByBudget.SupplierID, dbo.ViewSupplierWorkLoadOfferByBudget.InquiryType, 
                      dbo.ViewSupplierWorkLoadOfferByBudget.InquiryNumbers, dbo.ViewSupplierWorkLoadOfferByBudget.PointsInquiry, 
                      dbo.ViewSupplierWorkLoadOfferByBudget.InquiryQuotationPriceSum, dbo.ViewSupplierWorkLoadOfferByBudget.PointsValueSum, 
                      dbo.ViewSupplierWorkLoadOfferByBudget.PointsSum * 100 AS PointsSum, dbo.Suppliers.SupplierName AS Name, 
                      dbo.ViewSupplierWorkLoadOfferByBudget.BranchID
FROM         dbo.ViewSupplierWorkLoadOfferByBudget INNER JOIN
                      dbo.Suppliers ON dbo.ViewSupplierWorkLoadOfferByBudget.SupplierID = dbo.Suppliers.SupplierID

CREATE VIEW [dbo].[ViewFullSuppliersWorkLoadOfferAll]
AS
SELECT     dbo.ViewSupplierWorkLoadOfferAll.SupplierID, dbo.ViewSupplierWorkLoadOfferAll.InquiryType, dbo.ViewSupplierWorkLoadOfferAll.InquiryNumbers, 
                      dbo.ViewSupplierWorkLoadOfferAll.PointsInquiry, dbo.ViewSupplierWorkLoadOfferAll.InquiryQuotationPriceSum, dbo.ViewSupplierWorkLoadOfferAll.PointsValueSum, 
                      dbo.ViewSupplierWorkLoadOfferAll.PointsSum * 100 AS PointsSum, dbo.Suppliers.SupplierName AS Name, dbo.ViewSupplierWorkLoadOfferAll.BranchID
FROM         dbo.ViewSupplierWorkLoadOfferAll INNER JOIN
                      dbo.Suppliers ON dbo.ViewSupplierWorkLoadOfferAll.SupplierID = dbo.Suppliers.SupplierID

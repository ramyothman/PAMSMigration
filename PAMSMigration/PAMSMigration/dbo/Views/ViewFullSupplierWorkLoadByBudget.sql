CREATE VIEW [dbo].[ViewFullSupplierWorkLoadByBudget]
AS
SELECT     dbo.ViewSupplierWorkLoadByBudget.SupplierID, dbo.ViewSupplierWorkLoadByBudget.InquiryType, dbo.ViewSupplierWorkLoadByBudget.InquiryNumbers, 
                      dbo.ViewSupplierWorkLoadByBudget.PointsInquiry, dbo.ViewSupplierWorkLoadByBudget.InquiryQuotationPriceSum, 
                      dbo.ViewSupplierWorkLoadByBudget.PointsValueSum, dbo.ViewSupplierWorkLoadByBudget.PointsSum * 100 AS PointsSum, dbo.Suppliers.SupplierName AS Name, 
                      dbo.ViewSupplierWorkLoadByBudget.BranchID
FROM         dbo.ViewSupplierWorkLoadByBudget INNER JOIN
                      dbo.Suppliers ON dbo.ViewSupplierWorkLoadByBudget.SupplierID = dbo.Suppliers.SupplierID

CREATE VIEW [dbo].[View_PaidCommissionGraph]
AS
SELECT     CustomerID, CustomerName, SupplierID, SupplierName, Delivered, SUM(PaidCommissionAmount) AS PriceInEuro, YEAR(CommissionPaymentDate) AS Year, 
                      BranchID, CompanyCode
FROM         dbo.new_ViewSubCommissionGraph
WHERE     (CommissionPaymentDate IS NOT NULL)
GROUP BY CustomerID, CustomerName, SupplierID, SupplierName, YEAR(CommissionPaymentDate), Delivered, BranchID, CompanyCode

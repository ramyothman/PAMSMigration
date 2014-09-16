CREATE VIEW [dbo].[newViewGRCommissions]
AS
SELECT     Delivered, CustomerID, Customer, SupplierID, Supplier, YEAR(CommissionDate) AS Year, CASE WHEN SUM(CommissionAmountInEuro) IS NULL 
                      THEN 0 ELSE SUM(CommissionAmountInEuro) END AS PriceInEuro, CASE WHEN SUM(PaidCommissionAmount) IS NULL THEN 0 ELSE SUM(PaidCommissionAmount)
                       END AS PaidCommissionAmount, CASE WHEN SUM(RemainingCommissionAmount) IS NULL THEN 0 ELSE SUM(RemainingCommissionAmount) 
                      END AS RemainingCommissionAmount, BranchID
FROM         dbo.newViewSubFinalCommissions
GROUP BY YEAR(CommissionDate), Delivered, CustomerID, SupplierID, Customer, Supplier, BranchID

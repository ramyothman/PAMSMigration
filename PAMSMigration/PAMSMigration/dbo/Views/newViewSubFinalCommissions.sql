CREATE VIEW [dbo].[newViewSubFinalCommissions]
AS
SELECT     CustomerID, Customer, SupplierID, Supplier, CASE WHEN Delivered = 1 THEN DeliveredON ELSE OrderDate END AS CommissionDate, CommissionAmountInEuro, 
                      Delivered, PaidCommissionAmount, RemainingCommissionAmount, BranchID, BranchNameFL, BranchNameSL, CountryID, CountryName
FROM         dbo.newViewSubCommissionGraph

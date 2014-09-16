CREATE VIEW [dbo].[newViewSubCommissionGraph]
AS
SELECT     CustomerID, CompanyName AS Customer, SupplierID, SupplierName AS Supplier, Delivered, DeliveredON, OrderDate, PaidCommissionAmount, 
                      RemainingCommissionAmount, CommissionAmountInEuro, BranchID, BranchNameFL, BranchNameSL, CountryID, CountryName
FROM         dbo.ViewCommissions

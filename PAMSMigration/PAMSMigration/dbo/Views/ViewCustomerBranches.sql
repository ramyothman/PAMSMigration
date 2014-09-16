Create VIEW [dbo].[ViewCustomerBranches]
AS
SELECT        dbo.Customers.*, dbo.CustomerBranches.BranchID
FROM            dbo.Customers INNER JOIN
                         dbo.CustomerBranches ON dbo.Customers.CustomerID = dbo.CustomerBranches.CustomerID

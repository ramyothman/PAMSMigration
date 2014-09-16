CREATE PROCEDURE [dbo].[GetByIDCustomers]
    @CustomerID int
AS
BEGIN
Select * From [dbo].ViewCustomerBranches
WHERE [CustomerID] = @CustomerID
END

CREATE PROCEDURE [dbo].[DeleteCustomers]
    @CustomerID int
AS
Begin
 Delete [dbo].[Customers] where     [CustomerID] = @CustomerID
End

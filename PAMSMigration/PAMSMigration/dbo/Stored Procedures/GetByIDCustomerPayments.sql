CREATE PROCEDURE [dbo].[GetByIDCustomerPayments]
    @CustomerPaymentID int
AS
BEGIN
SELECT *
  FROM [dbo].[CustomerPayments]
WHERE [CustomerPaymentID] = @CustomerPaymentID
END

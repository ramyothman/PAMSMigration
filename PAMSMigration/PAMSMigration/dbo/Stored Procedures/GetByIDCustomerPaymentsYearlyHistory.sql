CREATE PROCEDURE [dbo].[GetByIDCustomerPaymentsYearlyHistory]
    @CustomerPaymentID int
AS
BEGIN
SELECT *
  FROM [dbo].[CustomerPaymentsYearlyHistory]
WHERE [CustomerPaymentID] = @CustomerPaymentID
END

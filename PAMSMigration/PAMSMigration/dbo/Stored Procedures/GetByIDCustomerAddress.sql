-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomerAddress]
@CustomerAddressID int
AS
BEGIN
SELECT *
  FROM [dbo].[CustomerAddress]
WHERE [CustomerAddressID] = @CustomerAddressID
END

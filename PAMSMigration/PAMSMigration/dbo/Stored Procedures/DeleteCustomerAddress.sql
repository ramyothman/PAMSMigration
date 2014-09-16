-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomerAddress]
@CustomerAddressID int
AS
BEGIN
	DELETE [dbo].[CustomerAddress]
	WHERE [CustomerAddressID] = @CustomerAddressID
END

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomerPhone]
@CustomerPhoneID int
AS
BEGIN
	DELETE [dbo].[CustomersPhones]
	WHERE [CustomerPhoneID] = @CustomerPhoneID
END

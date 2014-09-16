-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomersEmailAddress]
@CustomerEmailAddressID int
AS
BEGIN
	DELETE [CustomersEmailAddress]
 WHERE CustomerEmailAddressID = @CustomerEmailAddressID 
END

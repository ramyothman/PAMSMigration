-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomerMarket]
@ID int
AS
BEGIN
	DELETE [CustomerMarkets]
 WHERE ID = @ID 
END

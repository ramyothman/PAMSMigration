-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteCustomersTypes]
@ID int
AS
BEGIN
	DELETE [CustomersTypes]
 WHERE ID = @ID 
END

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomerSupplierRegistrationComments]
@ID int
AS
BEGIN
SELECT *
  FROM [dbo].[CustomerSupplierRegistrationComments]
WHERE [ID] = @ID
END

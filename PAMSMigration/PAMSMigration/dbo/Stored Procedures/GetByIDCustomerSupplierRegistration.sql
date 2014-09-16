-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomerSupplierRegistration]
@ID int
AS
BEGIN
SELECT *
  FROM [dbo].[CustomerSupplierRegistration]
WHERE [ID] = @ID
END

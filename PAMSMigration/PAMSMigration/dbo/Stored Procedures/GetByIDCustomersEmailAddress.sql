-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomersEmailAddress]
@CustomerEmailAddressID int
AS
BEGIN
  SELECT *
  FROM [dbo].[CustomersEmailAddress]
  WHERE CustomerEmailAddressID = @CustomerEmailAddressID
END

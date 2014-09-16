-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomersPhones]
@CustomerPhoneID int
AS
BEGIN
  SELECT *
  FROM [dbo].[CustomersPhones]
  WHERE CustomerPhoneID = @CustomerPhoneID
END

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomerMarket]
@ID int
AS
BEGIN
  SELECT *
  FROM [dbo].[CustomerMarkets]
  WHERE ID = @ID
END

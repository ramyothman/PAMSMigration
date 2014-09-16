-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDCustomersTypes]
@ID int
AS
BEGIN
  SELECT *
  FROM [dbo].[CustomersTypes]
  WHERE ID = @ID
END

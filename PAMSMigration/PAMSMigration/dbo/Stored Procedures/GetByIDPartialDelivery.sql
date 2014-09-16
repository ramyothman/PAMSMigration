-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialDelivery]
@PartialDeliveryID int 
AS
BEGIN
	SELECT *
  FROM [dbo].[PartialDelivery]
where PartialDeliveryID = @PartialDeliveryID
END

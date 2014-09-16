-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialDeliveryStatus]
	@ID int
	AS
	
BEGIN
	SELECT [PartialDeliveryStatusID]
      ,[PartialDeliveryStatus]
  FROM [dbo].[PartialDeliveryStatus]
  where [PartialDeliveryStatusID] = @ID
END

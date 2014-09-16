-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialDeliveryStatus]
	@PartialDeliveryStatusID int
	
	AS
	
BEGIN
Delete from [dbo].[PartialDeliveryStatus]  
 WHERE PartialDeliveryStatusID = @PartialDeliveryStatusID
END

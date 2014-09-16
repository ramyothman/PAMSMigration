-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePartialDeliveryStatus]
	@oldPartialDeliveryStatusID int
	,@PartialDeliveryStatus nvarchar(50)
	AS
	
BEGIN
UPDATE [dbo].[PartialDeliveryStatus]
   SET [PartialDeliveryStatus] = @PartialDeliveryStatus
 WHERE PartialDeliveryStatusID = @oldPartialDeliveryStatusID
END

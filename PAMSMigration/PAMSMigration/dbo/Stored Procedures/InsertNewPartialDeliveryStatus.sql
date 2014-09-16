-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialDeliveryStatus]
	@PartialDeliveryStatus nvarchar(50)
	AS
	
BEGIN
INSERT INTO [dbo].[PartialDeliveryStatus]
           ([PartialDeliveryStatus])
     VALUES
           (@PartialDeliveryStatus)
END

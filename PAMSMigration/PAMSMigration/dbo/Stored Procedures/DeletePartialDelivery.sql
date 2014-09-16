-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialDelivery]
           @PartialDeliveryID int
AS
BEGIN
	DELETE FROM [dbo].[PartialDelivery]
    WHERE PartialDeliveryID = @PartialDeliveryID
END

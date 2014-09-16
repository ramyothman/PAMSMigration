-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialShipmentDetails]
           @PartialShipmentDetailsID int
AS
BEGIN
	DELETE FROM [dbo].[PartialShipmentDetails]
    WHERE PartialShipmentDetailsID = @PartialShipmentDetailsID
END

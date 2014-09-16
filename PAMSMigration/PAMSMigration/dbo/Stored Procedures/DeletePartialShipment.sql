-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[DeletePartialShipment]
           @PartialShipmentID int
AS
BEGIN
	DELETE FROM [dbo].[PartialShipment]
    WHERE PartialShipmentID = @PartialShipmentID
END

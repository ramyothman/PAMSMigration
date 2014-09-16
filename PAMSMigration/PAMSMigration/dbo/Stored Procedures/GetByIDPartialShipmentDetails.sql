-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialShipmentDetails]
@PartialShipmentDetailsID int 
AS
BEGIN
SELECT *
  FROM [dbo].[PartialShipmentDetails]
where PartialShipmentDetailsID = @PartialShipmentDetailsID
END

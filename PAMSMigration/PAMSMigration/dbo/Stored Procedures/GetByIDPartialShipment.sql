-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialShipment]
@PartialShipmentID int 
AS
BEGIN
	SELECT *
  FROM [dbo].[PartialShipment]
where PartialShipmentID = @PartialShipmentID
END

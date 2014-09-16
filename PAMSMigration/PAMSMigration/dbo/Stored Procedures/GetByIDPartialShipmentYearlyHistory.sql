-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetByIDPartialShipmentYearlyHistory]
@PartialShipmentID int 
AS
BEGIN
	SELECT *
  FROM [dbo].[PartialShipmentYearlyHistory]
where PartialShipmentYearlyHistoryID = @PartialShipmentID
END

CREATE PROCEDURE [dbo].[GetByIDProductCustoms]
    @ProductCustomID int
AS
BEGIN
Select CustomValue, IsPercent, Name, ProductCustomID
From [dbo].[ProductCustoms]
WHERE [ProductCustomID] = @ProductCustomID
END

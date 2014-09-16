CREATE PROCEDURE [dbo].[GetByIDPartialLosts]
    @PartialOrderID int
AS
BEGIN
Select *
From [dbo].[PartialLost]
WHERE [PartialOrderID] = @PartialOrderID
END

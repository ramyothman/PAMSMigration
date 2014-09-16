CREATE PROCEDURE [dbo].[GetByIDProduct]
    @ProductID int
AS
BEGIN
Select *
From [dbo].[Product]
WHERE [ProductID] = @ProductID
END

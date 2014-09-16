CREATE PROCEDURE [dbo].[GetByIDProducts]
    @ProductID int
AS
BEGIN
Select *
From [dbo].[Products]
WHERE [ProductID] = @ProductID
END

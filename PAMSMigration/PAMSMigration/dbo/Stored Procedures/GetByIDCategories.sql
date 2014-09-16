CREATE PROCEDURE [dbo].[GetByIDCategories]
    @CategoryID int
AS
BEGIN
Select *
From [dbo].[Categories]
WHERE [CategoryID] = @CategoryID
END

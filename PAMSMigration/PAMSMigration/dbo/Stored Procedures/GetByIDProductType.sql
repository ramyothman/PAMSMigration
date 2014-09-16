CREATE PROCEDURE [dbo].[GetByIDProductType]
    @ProductTypeID int
AS
BEGIN
Select Name, ProductTypeID
From [dbo].[ProductType]
WHERE [ProductTypeID] = @ProductTypeID
END

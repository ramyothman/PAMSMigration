CREATE PROCEDURE [dbo].[GetByIDSuppliersProducts]
    @SupplierProductID int
AS
BEGIN
SELECT *
  FROM [dbo].[SuppliersProducts]
WHERE [SupplierProductID] = @SupplierProductID
END

CREATE PROCEDURE [dbo].[GetByIDSuppliersEmailAddress]
    @SupplierEmailAddressID int
AS
BEGIN
SELECT *
  FROM [dbo].[SuppliersEmailAddress]
WHERE [SupplierEmailAddressID] = @SupplierEmailAddressID
END

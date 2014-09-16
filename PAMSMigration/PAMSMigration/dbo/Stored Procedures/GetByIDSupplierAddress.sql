CREATE PROCEDURE [dbo].[GetByIDSupplierAddress]
    @SupplierAddressID int
AS
BEGIN
SELECT *
  FROM [dbo].[SupplierAddress]
WHERE [SupplierAddressID] = @SupplierAddressID
END

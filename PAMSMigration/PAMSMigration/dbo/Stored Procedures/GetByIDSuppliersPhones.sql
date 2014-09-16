CREATE PROCEDURE [dbo].[GetByIDSuppliersPhones]
    @SupplierPhoneID int
AS
BEGIN
SELECT *
  FROM [dbo].[SuppliersPhones]
WHERE [SupplierPhoneID] = @SupplierPhoneID
END

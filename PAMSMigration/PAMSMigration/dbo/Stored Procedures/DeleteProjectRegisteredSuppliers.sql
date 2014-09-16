Create PROCEDURE [dbo].[DeleteProjectRegisteredSuppliers]
    @ProjectRegisteredSupplierID int
AS
Begin
 Delete [dbo].[ProjectRegisteredSuppliers] where     [ProjectRegisteredSupplierID] = @ProjectRegisteredSupplierID
End

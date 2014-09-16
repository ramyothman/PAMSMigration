CREATE VIEW [dbo].[GetAllProjectRegisteredSuppliers]
AS
SELECT     dbo.ProjectRegisteredSuppliers.ProjectRegisteredSupplierID, dbo.ProjectRegisteredSuppliers.ProjectID, dbo.ProjectRegisteredSuppliers.SupplierID, 
                      dbo.ProjectRegisteredSuppliers.Comment, dbo.Suppliers.SupplierName, dbo.Suppliers.SupplierID AS supID
FROM         dbo.ProjectRegisteredSuppliers INNER JOIN
                      dbo.Suppliers ON dbo.ProjectRegisteredSuppliers.SupplierID = dbo.Suppliers.SupplierID

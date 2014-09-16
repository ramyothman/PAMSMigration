CREATE VIEW [dbo].[GetAllSuppliersProducts]
AS
SELECT     dbo.Products.ProductName, dbo.ProductTypes.ProductType, dbo.SuppliersProducts.SupplierID, dbo.SuppliersProducts.ProductDescription, 
                      dbo.SuppliersProducts.ProductID, dbo.SuppliersProducts.ProductTypeID, dbo.SuppliersProducts.CategoryID, dbo.SuppliersProducts.UserName, 
                      dbo.SuppliersProducts.ModifiedDate, dbo.SuppliersProducts.SupplierProductID, dbo.SuppliersProducts.IsActive, dbo.Category.Name AS CategoryName
FROM         dbo.SuppliersProducts INNER JOIN
                      dbo.Category ON dbo.SuppliersProducts.CategoryID = dbo.Category.CategoryID LEFT OUTER JOIN
                      dbo.Products ON dbo.SuppliersProducts.ProductID = dbo.Products.ProductID LEFT OUTER JOIN
                      dbo.ProductTypes ON dbo.SuppliersProducts.ProductTypeID = dbo.ProductTypes.ProductTypeID

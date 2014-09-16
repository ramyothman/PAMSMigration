/****** Object:  StoredProcedure [dbo].[GetAllSupplierWorkLoadFullNew]    Script Date: 03/20/2013 12:17:22 ******/
CREATE VIEW [dbo].[vw_SupplierBranches]
AS
SELECT     dbo.SupplierBranch.SupplierBranchID, dbo.SupplierBranch.BranchID, dbo.Suppliers.SupplierID, dbo.Suppliers.SupplierName, dbo.Suppliers.SupplierWebSite, 
                      dbo.Suppliers.ContactTitle, dbo.Suppliers.ContactName, dbo.Suppliers.ContactDisplayName, dbo.Suppliers.ContactHomePhone, dbo.Suppliers.ContactWorkPhone, 
                      dbo.Suppliers.ContactMobile, dbo.Suppliers.ContactEmail, dbo.Suppliers.ContactAddress, dbo.Suppliers.ContactCountry, dbo.Suppliers.ContactCity, 
                      dbo.Suppliers.ContactZip, dbo.Suppliers.ContactFax, dbo.Suppliers.UserName, dbo.Suppliers.ModifiedDate, dbo.Suppliers.HasSubSuppliers, dbo.Suppliers.Logo, 
                      dbo.Suppliers.IsPrincipale, dbo.Suppliers.CurrentCompany, dbo.Suppliers.SupplierTypeID, dbo.Suppliers.IsGeneral
FROM         dbo.SupplierBranch INNER JOIN
                      dbo.Suppliers ON dbo.SupplierBranch.SupplierID = dbo.Suppliers.SupplierID

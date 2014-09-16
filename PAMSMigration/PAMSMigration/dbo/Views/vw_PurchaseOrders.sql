CREATE VIEW [dbo].[vw_PurchaseOrders]
AS
SELECT        dbo.PurchaseOrder.PurchaseOrderID, dbo.PurchaseOrder.SupplierID, dbo.PurchaseOrder.SupplierNo, dbo.Suppliers.SupplierName, dbo.Suppliers.SupplierWebSite AS SupplierWebsite, 
                         dbo.Suppliers.ContactAddress AS SupplierAddress, dbo.Suppliers.ContactEmail AS SupplierEmail, dbo.Suppliers.ContactHomePhone AS SupplierHomeNumber, 
                         dbo.Suppliers.ContactWorkPhone AS SupplierWorkPhone, dbo.Suppliers.ContactMobile AS SupplierMobile, dbo.Suppliers.ContactFax AS SupplierFax, dbo.PurchaseOrder.PurchaseNo, 
                         dbo.PurchaseOrder.TotalPrice, dbo.PurchaseOrder.RateToEuro, dbo.PurchaseOrder.TotalPriceInEuro, dbo.PurchaseOrder.Deduction, dbo.PurchaseOrder.DeductionInEuro, dbo.PurchaseOrder.CurrencyID, 
                         dbo.Currencies.CurrencyCode, dbo.PurchaseOrder.CreationDate, dbo.PurchaseOrder.PurchaseDate, dbo.PurchaseOrder.CalculationSheetID, dbo.PurchaseOrder.IsRFQ, dbo.PurchaseOrder.IsPOConvert
FROM            dbo.PurchaseOrder INNER JOIN
                         dbo.Suppliers ON dbo.PurchaseOrder.SupplierID = dbo.Suppliers.SupplierID INNER JOIN
                         dbo.Currencies ON dbo.PurchaseOrder.CurrencyID = dbo.Currencies.ID

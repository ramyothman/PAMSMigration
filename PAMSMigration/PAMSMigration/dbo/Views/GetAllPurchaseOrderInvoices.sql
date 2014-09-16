CREATE VIEW [dbo].[GetAllPurchaseOrderInvoices]
AS
SELECT     dbo.PurchaseOrder.PurchaseOrderID, dbo.PurchaseOrder.SupplierID, dbo.PurchaseOrder.SupplierNo, dbo.PurchaseOrder.PurchaseNo, dbo.PurchaseOrder.TotalPrice, 
                      dbo.PurchaseOrder.RateToEuro, dbo.PurchaseOrder.TotalPriceInEuro, dbo.PurchaseOrder.Deduction, dbo.PurchaseOrder.DeductionInEuro, 
                      dbo.PurchaseOrder.CurrencyID, dbo.PurchaseOrder.CreationDate, dbo.PurchaseOrder.PurchaseDate, dbo.PurchaseOrder.CalculationSheetID, 
                      dbo.PruchaseOrderInvoices.PurchaseOrderInvoiceID, dbo.PruchaseOrderInvoices.RequiredPaidValue, dbo.PruchaseOrderInvoices.RequiredPaidValueInEuro, 
                      dbo.PruchaseOrderInvoices.RateToEuro AS InvoiceRateToEuro, dbo.PruchaseOrderInvoices.IsPaid, dbo.PruchaseOrderInvoices.InvoiceDate
FROM         dbo.PruchaseOrderInvoices INNER JOIN
                      dbo.PurchaseOrder ON dbo.PruchaseOrderInvoices.PurchaseOrderID = dbo.PurchaseOrder.PurchaseOrderID

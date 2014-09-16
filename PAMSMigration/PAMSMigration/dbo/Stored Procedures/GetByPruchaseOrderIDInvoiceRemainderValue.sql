CREATE PROCEDURE [dbo].[GetByPruchaseOrderIDInvoiceRemainderValue]
    @PurchaseOrderID int
AS
BEGIN
Select   isnull(  (select TotalPrice from purchaseorder where [PurchaseOrderID] = @PurchaseOrderID  ),0)   -  isnull( SUM( RequiredPaidValue ) , 0 )  as Remainder
From [dbo].[PruchaseOrderInvoices]
WHERE [PurchaseOrderID] = @PurchaseOrderID
END

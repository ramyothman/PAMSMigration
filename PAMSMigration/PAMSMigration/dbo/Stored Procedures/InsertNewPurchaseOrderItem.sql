CREATE PROCEDURE [dbo].[InsertNewPurchaseOrderItem]
    @ItemID int,   
    @PurchaseOrderID int,
    @Quantity int,
    @RateToEuro decimal(18,2),
    @RecievedQuantity int,
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @UnitPrice decimal(18,2),
    @UnitPriceInEuro decimal(18,2),
    @ItemOrder int,
    @ItemDescription nvarchar(Max)
AS
 
select @ItemOrder= isnull(MAX(ItemOrder),0) + 1 from PurchaseOrderItem where PurchaseOrderID = @PurchaseOrderID 
INSERT INTO [dbo].[PurchaseOrderItem] (
    [ItemID],
    [ItemOrder],
    [PurchaseOrderID],
    [Quantity],
    [RateToEuro],
    [RecievedQuantity],
    [TotalPrice],
    [TotalPriceInEuro],
    [UnitPrice],
    [UnitPriceInEuro],    
    [ItemDescription])
Values (
    @ItemID,
    @ItemOrder,
    @PurchaseOrderID,
    @Quantity,
    @RateToEuro,
    @RecievedQuantity,
    @TotalPrice,
    @TotalPriceInEuro,
    @UnitPrice,
    @UnitPriceInEuro,   
    @ItemDescription
    )
IF @@ROWCOUNT > 0
Select * from PurchaseOrderItem
Where [PurchaseOrderItemID] = @@identity

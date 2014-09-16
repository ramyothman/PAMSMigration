CREATE PROCEDURE [dbo].[UpdatePurchaseOrderItem]
    @ItemID int,
    @ItemOrder int,
    @PurchaseOrderID int,
    @OldPurchaseOrderItemID int,
    @Quantity int,
    @RateToEuro decimal(18,2),
    @RecievedQuantity int,
    @TotalPrice decimal(18,2),
    @TotalPriceInEuro decimal(18,2),
    @UnitPrice decimal(18,2),
    @UnitPriceInEuro decimal(18,2),
    @IsRecieved bit,
    @ItemDescription nvarchar(Max)
AS
UPDATE [dbo].[PurchaseOrderItem]
SET
    ItemID = @ItemID,
    ItemOrder = @ItemOrder,
    PurchaseOrderID = @PurchaseOrderID,
    Quantity = @Quantity,
    RateToEuro = @RateToEuro,
    RecievedQuantity = @RecievedQuantity,
    TotalPrice = @TotalPrice,
    TotalPriceInEuro = @TotalPriceInEuro,
    UnitPrice = @UnitPrice,
    UnitPriceInEuro = @UnitPriceInEuro,
    IsRecieved = @IsRecieved ,
    ItemDescription = @ItemDescription
WHERE [PurchaseOrderItemID] = @OLDPurchaseOrderItemID
IF @@ROWCOUNT > 0
Select * From PurchaseOrderItem 
Where [PurchaseOrderItemID] = @OLDPurchaseOrderItemID

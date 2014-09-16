﻿CREATE PROCEDURE [dbo].[InsertNewOrders]
    @InquiryNumber nvarchar(50),
    @OrderNumber nvarchar(50),
    @CustomerOrderNumber nvarchar(50),
    @SupplierOrderNumber nvarchar(50),
    @OrderDate datetime,
    @DeliveryTime int,
    @ExpansionDeliveryDate datetime,
    @PaymentTypeID int,
    @PriceBaseID int,
    @Price money,
    @CurrencyID int,
    @RateToEuro decimal(18,2),
    @ONDate datetime,
    @PriceInEuro money,
    @DeliveredON datetime,
    @Delivered bit,
    @Comment ntext,
    @UserName nvarchar(50),
    @ModifiedDate datetime,
    @PriceCommissionBase money,
    @PercentPriceCommissionBase decimal(18,4),
    @OrderStatusID int,
    @ParentOrderNumber nvarchar(50),
    @IsSubOrder bit,
    @BackLog decimal(18,4),
    @CompletedGoodsPaidON datetime,
    @IsCompletedGoodsPaid bit,
    @HasGuarantee bit,
	@DeliveryTimePeriodID int,
	@DiscountValue decimal(18, 4)
AS
INSERT INTO [dbo].[Orders] (
    [InquiryNumber],
    [OrderNumber],
    [CustomerOrderNumber],
    [SupplierOrderNumber],
    [OrderDate],
    [DeliveryTime],
    [ExpansionDeliveryDate],
    [PaymentTypeID],
    [PriceBaseID],
    [Price],
    [CurrencyID],
    [RateToEuro],
    [ONDate],
    [PriceInEuro],
    [DeliveredON],
    [Delivered],
    [Comment],
    [UserName],
    [ModifiedDate],
    [PriceCommissionBase],
    [PercentPriceCommissionBase],
    [OrderStatusID],
    [ParentOrderNumber],
    [IsSubOrder],
    [BackLog],
    [CompletedGoodsPaidON],
    [IsCompletedGoodsPaid],
    [HasGuarantee],
	DeliveryTimePeriodID,
	[DiscountValue])
Values (
    @InquiryNumber,
    @OrderNumber,
    @CustomerOrderNumber,
    @SupplierOrderNumber,
    @OrderDate,
    @DeliveryTime,
    @ExpansionDeliveryDate,
    @PaymentTypeID,
    @PriceBaseID,
    @Price,
    @CurrencyID,
    @RateToEuro,
    @ONDate,
    @PriceInEuro,
    @DeliveredON,
    @Delivered,
    @Comment,
    @UserName,
    @ModifiedDate,
    @PriceCommissionBase,
    @PercentPriceCommissionBase,
    @OrderStatusID,
    @ParentOrderNumber,
    @IsSubOrder,
    @BackLog,
    @CompletedGoodsPaidON,
    @IsCompletedGoodsPaid,
    @HasGuarantee,
	@DeliveryTimePeriodID,
	@DiscountValue)
IF @@ROWCOUNT > 0
Select * from Orders
Where [InquiryNumber] = @InquiryNumber

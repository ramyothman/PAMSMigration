-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePartialDelivery]
            @DeliveryNumber nvarchar(50)
           ,@InquiryNumber nvarchar(50)
           ,@PartialOrderNumber nvarchar(50)
           ,@DeliveryDate datetime
           ,@ProductTypeID int
           ,@ProductID int
           ,@SupplierID int
           ,@QuotationPrice decimal(18,4)
           ,@QuotationCurrencyID int
           ,@QuotationRateToEuro decimal(18,4)
           ,@QuotationRateDate datetime
           ,@QuotationPriceInEuro decimal(18,4)
           ,@OrderPrice decimal(18,4)
           ,@OrderPriceCurrencyID int
           ,@OrderPriceRateToEuro decimal(18,4)
           ,@OrderPriceInEuro decimal(18,4)
           ,@OrderPriceRateDate datetime
           ,@IsOrdered bit
           ,@IsDelivered bit
           ,@ItemDescription nvarchar(150)
           ,@Quantity int
           ,@Price decimal(18,4)
           ,@CurrencyID int
           ,@RateToEuro decimal(18,4)
           ,@RateDate datetime
           ,@PriceInEuro money
           ,@Remarks nvarchar(max)
           ,@ParialDeliveryStatusID int
           ,@oldPartialDeliveryID int
AS
BEGIN
if(@IsDelivered ='True')
   set @ParialDeliveryStatusID = 3
else if (@IsOrdered ='True')
 set @ParialDeliveryStatusID = 2
 
	UPDATE [dbo].[PartialDelivery]
   SET [DeliveryNumber] = @DeliveryNumber
      ,[InquiryNumber] = @InquiryNumber
      ,[PartialOrderNumber] = @PartialOrderNumber
      ,[DeliveryDate] = @DeliveryDate
      ,[ProductTypeID] = @ProductTypeID
      ,[ProductID] = @ProductID
      ,[SupplierID] = @SupplierID
      ,[QuotationPrice] = @QuotationPrice
      ,[QuotationCurrencyID] = @QuotationCurrencyID
      ,[QuotationRateToEuro] = @QuotationRateToEuro
      ,[QuotationRateDate] = @QuotationRateDate
      ,[QuotationPriceInEuro] = @QuotationPriceInEuro
      ,[OrderPrice] = @OrderPrice
      ,[OrderPriceCurrencyID] = @OrderPriceCurrencyID
      ,[OrderPriceRateToEuro] = @OrderPriceRateToEuro
      ,[OrderPriceInEuro] = @OrderPriceInEuro
      ,[OrderPriceRateDate] = @OrderPriceRateDate
      ,[IsOrdered] = @IsOrdered
      ,[IsDelivered] = @IsDelivered
      ,[ItemDescription] = @ItemDescription
      ,[Quantity] = @Quantity
      ,[Price] = @Price
      ,[CurrencyID] = @CurrencyID
      ,[RateToEuro] = @RateToEuro
      ,[RateDate] = @RateDate
      ,[PriceInEuro] = @PriceInEuro
      ,[Remarks] = @Remarks
      ,[ParialDeliveryStatusID] = @ParialDeliveryStatusID
 WHERE PartialDeliveryID = @oldPartialDeliveryID
END

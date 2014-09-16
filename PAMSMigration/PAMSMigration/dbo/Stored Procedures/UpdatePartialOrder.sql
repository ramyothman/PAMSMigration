-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePartialOrder]
            @ItemTagNumber nvarchar(50)
           ,@ItemModelSize nvarchar(150)
           ,@InquiryNumber nvarchar(50)
           ,@Quantity int
           ,@ProductTypeID int
           ,@ProductID int
           ,@SupplierID int
           ,@ItemOfferPrice decimal(18,4)
           ,@ItemOfferCurrencyID int
           ,@ItemOfferRateToEuro decimal(18,4)
           ,@ItemOfferRateDate datetime 
           ,@TotalItemOfferPrice decimal(18,4)
           ,@TotalItemOfferPriceInEuro decimal(18,4)
           ,@ItemOrderPrice decimal(18,4)
           ,@ItemOrderPriceCurrencyID int
           ,@ItemOrderPriceRateToEuro decimal(18,4)
           ,@TotalItemOrderPrice decimal(18,4)
           ,@TotalItemOrderPriceInEuro decimal(18,4)
           ,@OrderPriceRateDate datetime 
           ,@IsOrdered bit
           ,@Remarks nvarchar(max)
           ,@ParialDeliveryStatusID int
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime 
           ,@oldPartialOrderID int
AS
BEGIN
--if (@IsOrdered ='True')
-- set @ParialDeliveryStatusID = 3
 
	UPDATE [dbo].[PartialOrder]
   SET [ItemTagNumber] = @ItemTagNumber
      ,[ItemModelSize] = @ItemModelSize
      ,[InquiryNumber] = @InquiryNumber
      ,[Quantity] = @Quantity
      ,[ProductTypeID] = @ProductTypeID
      ,[ProductID] = @ProductID
      ,[SupplierID] = @SupplierID
      ,[ItemOfferPrice] = @ItemOfferPrice
      ,[ItemOfferCurrencyID] = @ItemOfferCurrencyID
      ,[ItemOfferRateToEuro] = @ItemOfferRateToEuro
      ,[ItemOfferRateDate] = @ItemOfferRateDate
      ,[TotalItemOfferPrice] = @TotalItemOfferPrice
      ,[TotalItemOfferPriceInEuro] = @TotalItemOfferPriceInEuro
      ,[ItemOrderPrice] = @ItemOrderPrice
      ,[ItemOrderPriceCurrencyID] = @ItemOrderPriceCurrencyID
      ,[ItemOrderPriceRateToEuro] = @ItemOrderPriceRateToEuro
      ,[TotalItemOrderPrice] = @TotalItemOrderPrice
      ,[TotalItemOrderPriceInEuro] = @TotalItemOrderPriceInEuro
      ,[OrderPriceRateDate] = @OrderPriceRateDate
      ,[IsOrdered] = @IsOrdered
      ,[Remarks] = @Remarks
      ,[ParialDeliveryStatusID] = @ParialDeliveryStatusID
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE PartialOrderID = @oldPartialOrderID
END

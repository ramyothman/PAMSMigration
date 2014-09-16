-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialDelivery]
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
AS
BEGIN
set @ParialDeliveryStatusID = 1
	INSERT INTO [dbo].[PartialDelivery]
           ([DeliveryNumber]
           ,[InquiryNumber]
           ,[PartialOrderNumber]
           ,[DeliveryDate]
           ,[ProductTypeID]
           ,[ProductID]
           ,[SupplierID]
           ,[QuotationPrice]
           ,[QuotationCurrencyID]
           ,[QuotationRateToEuro]
           ,[QuotationRateDate]
           ,[QuotationPriceInEuro]
           ,[OrderPrice]
           ,[OrderPriceCurrencyID]
           ,[OrderPriceRateToEuro]
           ,[OrderPriceInEuro]
           ,[OrderPriceRateDate]
           ,[IsOrdered]
           ,[IsDelivered]
           ,[ItemDescription]
           ,[Quantity]
           ,[Price]
           ,[CurrencyID]
           ,[RateToEuro]
           ,[RateDate]
           ,[PriceInEuro]
           ,[Remarks]
           ,[ParialDeliveryStatusID])
     VALUES
           (@DeliveryNumber 
           ,@InquiryNumber 
           ,@PartialOrderNumber 
           ,@DeliveryDate
           ,@ProductTypeID 
           ,@ProductID 
           ,@SupplierID 
           ,@QuotationPrice 
           ,@QuotationCurrencyID 
           ,@QuotationRateToEuro 
           ,@QuotationRateDate 
           ,@QuotationPriceInEuro 
           ,@OrderPrice
           ,@OrderPriceCurrencyID 
           ,@OrderPriceRateToEuro 
           ,@OrderPriceInEuro 
           ,@OrderPriceRateDate 
           ,@IsOrdered
           ,@IsDelivered 
           ,@ItemDescription 
           ,@Quantity 
           ,@Price 
           ,@CurrencyID 
           ,@RateToEuro 
           ,@RateDate 
           ,@PriceInEuro 
           ,@Remarks 
           ,@ParialDeliveryStatusID )
           
IF @@ROWCOUNT > 0
Select * from [PartialDelivery]
Where PartialDeliveryID = @@identity
END

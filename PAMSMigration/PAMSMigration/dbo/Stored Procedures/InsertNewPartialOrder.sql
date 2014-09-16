-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[InsertNewPartialOrder]
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
AS
BEGIN
set @ParialDeliveryStatusID = 2
INSERT INTO [dbo].[PartialOrder]
           ([ItemTagNumber]
           ,[ItemModelSize]
           ,[InquiryNumber]
           ,[Quantity]
           ,[ProductTypeID]
           ,[ProductID]
           ,[SupplierID]
           ,[ItemOfferPrice]
           ,[ItemOfferCurrencyID]
           ,[ItemOfferRateToEuro]
           ,[ItemOfferRateDate]
           ,[TotalItemOfferPrice]
           ,[TotalItemOfferPriceInEuro]
           ,[ItemOrderPrice]
           ,[ItemOrderPriceCurrencyID]
           ,[ItemOrderPriceRateToEuro]
           ,[TotalItemOrderPrice]
           ,[TotalItemOrderPriceInEuro]
           ,[OrderPriceRateDate]
           ,[IsOrdered]
           ,[Remarks]
           ,[ParialDeliveryStatusID]
           ,[UserName]
           ,[ModifiedDate])
     VALUES
           (@ItemTagNumber 
           ,@ItemModelSize 
           ,@InquiryNumber 
           ,@Quantity 
           ,@ProductTypeID 
           ,@ProductID 
           ,@SupplierID 
           ,@ItemOfferPrice 
           ,@ItemOfferCurrencyID
           ,@ItemOfferRateToEuro
           ,@ItemOfferRateDate 
           ,@TotalItemOfferPrice 
           ,@TotalItemOfferPriceInEuro
           ,@ItemOrderPrice 
           ,@ItemOrderPriceCurrencyID
           ,@ItemOrderPriceRateToEuro
           ,@TotalItemOrderPrice
           ,@TotalItemOrderPriceInEuro
           ,@OrderPriceRateDate
           ,@IsOrdered
           ,@Remarks
           ,@ParialDeliveryStatusID 
           ,@UserName 
           ,@ModifiedDate)
           
IF @@ROWCOUNT > 0
Select * from [PartialOrder]
Where PartialOrderID = @@identity
END

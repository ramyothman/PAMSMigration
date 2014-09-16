-- =============================================
-- Author:		@Author,,Name>
-- Create date: @Create Date,
-- Description:	@Description,
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePartialShipment]
            @ShipmentNumber nvarchar(50)
           ,@InquiryNumber nvarchar(50)
           ,@InvoiceNumber nvarchar(150)             
           ,@ShipmentDate datetime          
           ,@ItemDescription nvarchar(150)          
           ,@Price decimal(18,4)
            ,@Invoicevalue decimal(18,4)
            ,@InvoicevalueInEuro decimal(18,4)
           ,@CurrencyID int
           ,@RateToEuro decimal(18,4)
           ,@RateDate datetime
           ,@PriceInEuro money
           ,@Remarks nvarchar(max)
           ,@UserName nvarchar(50)
           ,@ModifiedDate datetime  
           ,@OldPartialShipmentID int  
AS
BEGIN
 
	UPDATE [dbo].[PartialShipment]
   SET [ShipmentNumber] = @ShipmentNumber
      ,[InquiryNumber] = @InquiryNumber
      ,[InvoiceNumber]= @InvoiceNumber
      ,[ShipmentDate] = @ShipmentDate
      ,[ItemDescription] = @ItemDescription      
      ,[Price] = @Price
      , [Invoicevalue]  =@Invoicevalue 
       , [InvoicevalueInEuro]  =@InvoicevalueInEuro 
      ,[CurrencyID] = @CurrencyID
      ,[RateToEuro] = @RateToEuro
      ,[RateDate] = @RateDate
      ,[PriceInEuro] = @PriceInEuro
      ,[Remarks] = @Remarks
      ,[UserName] = @UserName
      ,[ModifiedDate] = @ModifiedDate
 WHERE [PartialShipmentID] = @OldPartialShipmentID
END
